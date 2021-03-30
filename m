Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80934DF6F
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 05:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B106E845;
	Tue, 30 Mar 2021 03:36:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDA56E845
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 03:36:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617075387; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HnegzL6kgP1wk+tB6MY3REkS8nPIox6nxJ1CKMh4WkE=;
 b=Jk1HK5qaaBfMcfHNLeQBu0F7ul36XUY8Yt9ryNJLirgKMe7cXebqp/7uUQfna1e7AaiKaXhc
 c2Tvoxqt9vE5ObT3zPm669Ex4ebzJBGw9ZJDvE4tNnXeFfVj+yG8esviS0jS1eyJ1Ul4o7k/
 mUk/n41Xs6f9KkRXzln1WS/IMsU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60629cab876af85fc473c90d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 03:36:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 91318C43461; Tue, 30 Mar 2021 03:36:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.211.32.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EFF5C433CA;
 Tue, 30 Mar 2021 03:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EFF5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>
References: <20210330013408.2532048-1-john.stultz@linaro.org>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <06292101-9233-83df-942d-d49a4e53fc3e@codeaurora.org>
Date: Tue, 30 Mar 2021 09:06:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm: Fix removal of valid error case
 when checking speed_bin
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, YongQin Liu <yongqin.liu@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 3/30/2021 7:04 AM, John Stultz wrote:
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
> 
> That change resulted in the db845c board display to fail to
> start, with the following error:
> 
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
> 
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: YongQin Liu <yongqin.liu@linaro.org>
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 690409ca8a186..cb2df8736ca85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1406,7 +1406,13 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>   	int ret;
>   
>   	ret = nvmem_cell_read_u16(dev, "speed_bin", &speedbin);
> -	if (ret) {
> +	/*
> +	 * -ENOENT means that the platform doesn't support speedbin which is
> +	 * fine
> +	 */
> +	if (ret == -ENOENT) {
> +		return 0;
> +	} else if (ret) {
>   		DRM_DEV_ERROR(dev,
>   			      "failed to read speed-bin (%d). Some OPPs may not be supported by hardware",
>   			      ret);
> 

Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>

This looks "fine" to me. ;)

-Akhil.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
