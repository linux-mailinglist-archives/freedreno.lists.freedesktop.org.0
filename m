Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0AC8C93F6
	for <lists+freedreno@lfdr.de>; Sun, 19 May 2024 10:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141610E15A;
	Sun, 19 May 2024 08:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/NwqV9X";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEB610E15A
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 08:31:12 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-51fdc9af005so3749313e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 19 May 2024 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716107470; x=1716712270; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O3x30n4rUJq1+J/cwi02KSucHGfHRmh38wGSJ7vLBLs=;
 b=b/NwqV9XNtGxl9VnB2uDz6Ge2KlhulGIEmeL3n5kvdppg3Wx/6Yz/jdja9DWt7VT7T
 99gJgigWP4a4wc17TfdNXgGaCeGx38awwZ9RvPEGXbtsTUTij2OOwbX6Ql2K5GyPt+Qp
 QjY34MDRTPIslCm7Dbq4ly2UA/3D/uIAzkLTnkM82mP/zIC2zdZuun3Mh2s3O8X4QiX6
 beZe0YgcPqLb21jXRqmpcZwHjGawsuqJqd4caMM6s/q7UxyUcCx25086TThgt1wbRNm8
 G7nSfuk1EErtgrBaf30RdSSyXgPV+JaSSgSVzIFwP1xs4o6dJkVZ594NkEDChi3fesoE
 aI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716107470; x=1716712270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O3x30n4rUJq1+J/cwi02KSucHGfHRmh38wGSJ7vLBLs=;
 b=iPJq3v/B3vf2gvVRK4pyXBHsckf5zGxtetIUmsmr/KtyCw95gOBkGPQTuSq+PS/yvd
 ZbkzxpabKn0gV6qUpNg0G6XkGsRrfvqTZezB6JZctFhwOM5w45Pq2UV5kZ116iRRZI5W
 Qd8S//3rGQvJjYOvOBgsv1i1lf8WghZBO8ggUosQuaONvbB138f1F4EuYPQN1ltxRISC
 dULfLemttHhoz4xXX+3MNgD/ntg4D9zSWge+68QgXO1oZSMPiwCC7y+n9D+rOm15/NE1
 RtDrK0QBtb11QPD/12xCxCnzxm4nDFVb7IU1oM+5tmfC+TRF2t+7kc3dF6Pbh/0KQRmB
 CrFA==
X-Gm-Message-State: AOJu0YwzhI4pfpjMETuKT34ay/igOiQN6N/StkKxMGSVWbpPST9v1FcD
 x0p8iqw8oq1woQVnoDr0qaltHraxwRCk3p/YxxbG1/U/sXddVdQI0EIeqS7f9SM=
X-Google-Smtp-Source: AGHT+IERJwac+d8XpIpGcOzehZBQ8zzZtThV/IUxxI/UfebWaSGBVYpY+oyFYOdhW5bfzMUQPlo0Hg==
X-Received: by 2002:a05:6512:3e17:b0:51d:605e:f0ce with SMTP id
 2adb3069b0e04-52210278698mr30114392e87.50.1716107470416; 
 Sun, 19 May 2024 01:31:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ba5d5sm3779923e87.77.2024.05.19.01.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 01:31:10 -0700 (PDT)
Date: Sun, 19 May 2024 11:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 seanpaul@chromium.org, swboyd@chromium.org, dianders@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] drm/msm: register a fault handler for display
 mmu faults
Message-ID: <cwo63ra2ogrdr3ywmiuxewzuxzsyozyqfcict7xs5kp6uwy2qp@7e6fgb7oyszc>
References: <20240517233801.4071868-1-quic_abhinavk@quicinc.com>
 <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517233801.4071868-2-quic_abhinavk@quicinc.com>
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

On Fri, May 17, 2024 at 04:37:56PM -0700, Abhinav Kumar wrote:
> In preparation to register a iommu fault handler for display
> related modules, register a fault handler for the backing
> mmu object of msm_kms.
> 
> Currently, the fault handler only captures the display snapshot
> but we can expand this later if more information needs to be
> added to debug display mmu faults.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index af6a6fcb1173..62c8e6163e81 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -200,6 +200,28 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  	return aspace;
>  }
>  
> +static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void *data)
> +{
> +	struct msm_kms *kms = arg;
> +	struct msm_disp_state *state;
> +	int ret;
> +
> +	ret = mutex_lock_interruptible(&kms->dump_mutex);
> +	if (ret)
> +		return ret;
> +
> +	state = msm_disp_snapshot_state_sync(kms);
> +
> +	mutex_unlock(&kms->dump_mutex);
> +
> +	if (IS_ERR(state)) {
> +		DRM_DEV_ERROR(kms->dev->dev, "failed to capture snapshot\n");
> +		return PTR_ERR(state);
> +	}
> +
> +	return 0;
> +}
> +
>  void msm_drm_kms_uninit(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -261,6 +283,9 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
>  		goto err_msm_uninit;
>  	}
>  
> +	if (kms->aspace)
> +		msm_mmu_set_fault_handler(kms->aspace->mmu, kms, msm_kms_fault_handler);
> +

Can we move this to msm_kms_init_aspace() instead of checking for
kms->aspace?

>  	drm_helper_move_panel_connectors_to_head(ddev);
>  
>  	drm_for_each_crtc(crtc, ddev) {
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry
