import { Stack } from 'aws-cdk-lib';
import * as ecr from 'aws-cdk-lib/aws-ecr';

export function createECRRepository(this: Stack): void {
    // TODO: finish me
    const repository = new ecr.Repository(this, 'my_repository');
}
