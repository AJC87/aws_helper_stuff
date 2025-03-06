import { Duration, RemovalPolicy, Stack } from 'aws-cdk-lib';
import * as ecr from 'aws-cdk-lib/aws-ecr';
import * as iam from 'aws-cdk-lib/aws-iam';
import { IRuleTarget } from 'aws-cdk-lib/aws-events';

declare const target: IRuleTarget;

//  Provenance? other properties

export function createECRRepository(this: Stack): void {
    //  TODO: finish me

    //  Get user from elsewhere
    // const user = new iam.User(this, 'my_user');
    // ecr.AuthorizationToken.grantRead(user);
    // ecr.PublicGalleryAuthorizationToken.grantRead(user);

    //  Get role from elsewhere, set up CodeBuild
    // const role = new iam.Role(this, 'my_role', {
    //     assumedBy: new iam.ServicePrincipal('codebuild.amazonaws.com'),
    //   });

    const repository = new ecr.Repository(this, 'my_repository', {
        // False for now to save money
        imageScanOnPush: false,
        imageTagMutability: ecr.TagMutability.IMMUTABLE,
        //  Maybe costs money
        encryption: ecr.RepositoryEncryption.KMS,
        removalPolicy: RemovalPolicy.DESTROY,
        //  Do we always want to delete?
        emptyOnDelete: true,
      });

    //  What does max image count do here?
    repository.addLifecycleRule({ tagPrefixList: ['prod'], maxImageCount: 100 });
    repository.addLifecycleRule({ maxImageAge: Duration.days(30) });

    //  Add other permissions too
    // repository.grantPush(role);

    // repository.onImageScanCompleted('ImageScanComplete')
    //     .addTarget(target);
}
