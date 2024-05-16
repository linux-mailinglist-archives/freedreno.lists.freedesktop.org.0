Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5C8C7315
	for <lists+freedreno@lfdr.de>; Thu, 16 May 2024 10:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CAF10E156;
	Thu, 16 May 2024 08:43:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E16E10E156
 for <freedreno@lists.freedesktop.org>; Thu, 16 May 2024 08:43:04 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 070501F53E;
 Thu, 16 May 2024 10:43:01 +0200 (CEST)
Date: Thu, 16 May 2024 10:43:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
Message-ID: <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> When create_address_space() fails (e.g. when smmu node is disabled)
> msm_gpu_init() silently fails:
> 
> msm_dpu c901000.display-controller: failed to load adreno gpu
> msm_dpu c901000.display-controller: failed to bind 5000000.gpu (ops a3xx_ops): -19
> 
> Log create_address_space() failure.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

Thanks!

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>

And, after checking the below:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 655002b21b0d5..f1e692866cc38 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -941,6 +941,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  		DRM_DEV_INFO(drm->dev, "%s: no IOMMU, fallback to VRAM carveout!\n", name);
>  	else if (IS_ERR(gpu->aspace)) {
>  		ret = PTR_ERR(gpu->aspace);
> +		DRM_DEV_ERROR(drm->dev, "could not create address space: %d\n", ret);

Maybe this wasn't done before because this also includes `-EPROBE_DEFER`, so you
might want to wrap this in

	if (ret != -EPROBE_DEFER)
		DRM_DEV_ERROR...

But then dev_err_probe() was built specifically to be less verbose about this
(and track defer reasons).  While this is an init and not probe function, it's
called from struct component_ops->bind where it should be okay to call that,
as long as you have access to the component `struct device*` and not its master
(IIRC).

- Marijn

>  		goto fail;
>  	}
>  
> -- 
> 2.34.1
> 
