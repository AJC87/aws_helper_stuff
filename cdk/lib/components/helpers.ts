import { Stack } from 'aws-cdk-lib';
import * as ecr from 'aws-cdk-lib/aws-ecr';
import * as iam from 'aws-cdk-lib/aws-iam';
import { IRuleTarget } from 'aws-cdk-lib/aws-events';

declare const target: IRuleTarget;

export function createECRRepository(this: Stack): void {
    // TODO: finish me

    // Get user from elsewhere
    // const user = new iam.User(this, 'my_user');
    // ecr.AuthorizationToken.grantRead(user);
    // ecr.PublicGalleryAuthorizationToken.grantRead(user);

    // Get role from elsewhere, set up CodeBuild
    // const role = new iam.Role(this, 'my_role', {
    //     assumedBy: new iam.ServicePrincipal('codebuild.amazonaws.com'),
    //   });

    const repository = new ecr.Repository(this, 'my_repository', {
        // False for now to save money
        imageScanOnPush: false,
      });

    // repository.grantPush(role);

    // repository.onImageScanCompleted('ImageScanComplete')
    //     .addTarget(target);
}
