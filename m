Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2A74BA06
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 01:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C09ED10E02C;
	Fri,  7 Jul 2023 23:25:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925B910E011
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 23:25:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso3827745e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 16:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688772344; x=1691364344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zQ2+XEGD260QKN9UUSGir4k9TWs8vNlxD4BF4i8wMMQ=;
 b=CGwpLiT/B/4VDgrHM0hX4dL8yG/wSiWOeH7sdp3MyWqdVAIVMR2+9kp7gOzEyHZD7E
 ZGJYn2giYDpwEZab5T3oNSvPtz9ygO/rX7Wlpy7+EVo/YzXTeO+KyJGHjHapfyZ6td/v
 QYdc2SaJyqslwCAucX4hHkqD2FWBqBCwPsW+86YbekluPY+QLUXp2BnrpbNKUuRE5skX
 n89RRlrGEAaoKFRxZ4Z+TXNBwIX5oDoeCW1JlubLPzfXLMaJdJ4ht5Hd3xKZ8rzVpbzY
 zZFWT/ZB/IMCPmNmCQD0GJYmAFZDwqXfpZopApio+WPo3UuCiOtVDsWckBdxNmttWuA0
 12ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688772344; x=1691364344;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ2+XEGD260QKN9UUSGir4k9TWs8vNlxD4BF4i8wMMQ=;
 b=B3ipJjPwUexZNtiQEsLF6XDg3ip+A/6mXleq4bsqb950uzuiXuWtt2S3N3jEOwBgru
 +c79ZNn3S22ZcaSFw9qhFCd+pphZpaXAHJA5TJbF4KXHPp8WAAuqoxniFT6ZD8piWj8U
 m7eWIJaeHxeZIyCxBY+ZpF+vvwMb2FGFMcnBbhFyH44Qx+BPs9JGpkuzreSfdzUvf61Z
 E7b/0G4QI95taZNM5bw0N51z3zMTTKVQ1Uri66eoNYNIw/PxRMa5xdqwg+KykbLN6bia
 kg7r+uwDLaEJh9jGb2e7uQlhplEKFBkwA6OiwZqWmeRRTNmq5GOYpZviASbldF9eb3Y7
 7CXQ==
X-Gm-Message-State: ABy/qLbvbD8sFuw+ew7uXOCCVYCuTpniyoIVGjUc/DpZXkdtJXI2R1zw
 odsgqPRL2jr95Ldmvq5EXgzchA==
X-Google-Smtp-Source: APBJJlGniTahtLJ/ma4pjlCH1yxUtM0x1txWCN3QAvNj2+f0F+snWAvD+8luPjq4cFf/9eyMjhPi2Q==
X-Received: by 2002:a05:6512:694:b0:4f8:68a3:38e2 with SMTP id
 t20-20020a056512069400b004f868a338e2mr5647505lfe.0.1688772343764; 
 Fri, 07 Jul 2023 16:25:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004fad16596fasm842149lff.21.2023.07.07.16.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 16:25:43 -0700 (PDT)
Message-ID: <81ff3de5-4fe4-9c01-5655-78f5311f7817@linaro.org>
Date: Sat, 8 Jul 2023 01:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
 <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230707203724.3820757-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init
 error path
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 7.07.2023 22:37, Dmitry Baryshkov wrote:
> It was noticed that dpu_kms_hw_init()'s error path contains several
> labels which point to the same code path. Replace all of them with a
> single label.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
it's the first time I'm seeing this code

Konrad
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index c11b3ab572ab..e7ac02e92f42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1037,7 +1037,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	if (!dpu_kms->catalog) {
>  		DPU_ERROR("device config not known!\n");
>  		rc = -EINVAL;
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	/*
> @@ -1047,13 +1047,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = _dpu_kms_mmu_init(dpu_kms);
>  	if (rc) {
>  		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
>  	if (rc) {
>  		DPU_ERROR("rm init failed: %d\n", rc);
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_kms->rm_init = true;
> @@ -1065,7 +1065,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		rc = PTR_ERR(dpu_kms->hw_mdp);
>  		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
>  		dpu_kms->hw_mdp = NULL;
> -		goto power_error;
> +		goto err_pm_put;
>  	}
>  
>  	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
> @@ -1076,7 +1076,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
> -			goto power_error;
> +			goto err_pm_put;
>  		}
>  
>  		dpu_kms->hw_vbif[vbif->id] = hw;
> @@ -1092,7 +1092,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
>  	if (rc) {
>  		DPU_ERROR("failed to init perf %d\n", rc);
> -		goto perf_err;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
> @@ -1100,7 +1100,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		rc = PTR_ERR(dpu_kms->hw_intr);
>  		DPU_ERROR("hw_intr init failed: %d\n", rc);
>  		dpu_kms->hw_intr = NULL;
> -		goto hw_intr_init_err;
> +		goto err_pm_put;
>  	}
>  
>  	dev->mode_config.min_width = 0;
> @@ -1125,7 +1125,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	rc = _dpu_kms_drm_obj_init(dpu_kms);
>  	if (rc) {
>  		DPU_ERROR("modeset init failed: %d\n", rc);
> -		goto drm_obj_init_err;
> +		goto err_pm_put;
>  	}
>  
>  	dpu_vbif_init_memtypes(dpu_kms);
> @@ -1134,10 +1134,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	return 0;
>  
> -drm_obj_init_err:
> -hw_intr_init_err:
> -perf_err:
> -power_error:
> +err_pm_put:
>  	pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  error:
>  	_dpu_kms_hw_destroy(dpu_kms);
