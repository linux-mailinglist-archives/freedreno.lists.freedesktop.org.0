Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF180A25A
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 12:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73DF10EA93;
	Fri,  8 Dec 2023 11:36:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97DA10EA90
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 11:36:37 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5d74186170fso17053457b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Dec 2023 03:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702035396; x=1702640196; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
 b=MzjMlwD7o7iqjSL9Qeh77SapYI5s6EzZw3QAvrglrpINHMM6khI6g0PBr7UMYLB7UM
 g+U7QkOBNqDUYJWXY++Dh5rJ2Cj/0cBR+sksyRgvK7MY3uKWnfP/bZmmEsyj2sWczQ/i
 HglCMAr8sOCc05ktyY1UOFhjx2FUQCOzcG90BnYvHOPNkud5wZgC5kqwnZdflgk5eKJC
 O/ehw2mobn8emeePG4oqCIJ0RUOVDIQ+gJJ/pc5Ev88dXQ8Ck1jCk6lorpA8prQdmQy/
 iN2cFl4OeZ2EGKtzIYRER1EXfzAqI/UsE37mzEhIl84d4EyBh2lahbAy++lsoyDNI8g8
 88lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702035396; x=1702640196;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9vphCG37O8eMkMC8HIffZ3tk8WXWBglaXiyl76vCMdg=;
 b=fd4XC+cBTe4zfnVl24ieYTAkf8xjJZKpx8GVFHE2grRDvr84xp5Nfz9KpmbI3vqDLa
 RWTeIDiHBoUd09pCHgftbU9RPkmyy3CDBXV57tCVEr+2jtlJ6LJhR0xnytaTWN1Ny5ue
 LQf+H5TnpYK8RvuR0EQXr4WxSEZZC0cLyQcp3/d/EkwrmmXMdJxaX1IeAdz1xgFc8d6M
 XStEYuDUirEYKMjWjCZHYmP408iQGT26LdrZLP9+MedezlfNXIZc84SXYhOVYKTN2lyZ
 OEdBBqRWPQJk5omjYY/gHDT+vz4rgM5TfayRc9BB4SzMN5acaiycrOmeJA2s7sFk8+Sh
 uMBQ==
X-Gm-Message-State: AOJu0YzuZSS9gwlpxdy0pGiApElfsthraVqEgkCLQdr8L2R4aT6knyUR
 zg7wO2GquzniLhyBSCu2wBBM8DvDdgPb9DUG/P3ryQ==
X-Google-Smtp-Source: AGHT+IGNbm4h8qNGjXg60DMzqF5TvBlaPsJbNi3hCXSZ1UuSvxxiPwgPotz2EPuscLJPFJRKdrmJugMk2E/Rs8uOkp4=
X-Received: by 2002:a0d:ea0b:0:b0:5d7:1940:7d79 with SMTP id
 t11-20020a0dea0b000000b005d719407d79mr3847704ywe.80.1702035396669; Fri, 08
 Dec 2023 03:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20231208050641.32582-1-quic_abhinavk@quicinc.com>
 <20231208050641.32582-12-quic_abhinavk@quicinc.com>
In-Reply-To: <20231208050641.32582-12-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 13:36:25 +0200
Message-ID: <CAA8EJpo6=5mq8zCoBvdr73TsEFH96JS-mUo3Ks9go4VjBCm8uA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] drm/msm/dpu: add support to disable CDM block
 during encoder cleanup
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, quic_parellan@quicinc.com,
 Daniel Vetter <daniel@ffwll.ch>, quic_jesszhan@quicinc.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 8 Dec 2023 at 07:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> In preparation of setting up CDM block, add the logic to disable it
> properly during encoder cleanup.
>
> changes in v2:
>         - call update_pending_flush_cdm even when bind_pingpong_blk
>           is not present
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 ++
>  2 files changed, 12 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below

>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index aa1a1646b322..862912727925 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -26,6 +26,7 @@
>  #include "dpu_hw_dspp.h"
>  #include "dpu_hw_dsc.h"
>  #include "dpu_hw_merge3d.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
> @@ -2050,6 +2051,15 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> +       if (phys_enc->hw_cdm) {
> +               if (phys_enc->hw_cdm->ops.bind_pingpong_blk && phys_enc->hw_pp)
> +                       phys_enc->hw_cdm->ops.bind_pingpong_blk(phys_enc->hw_cdm,
> +                                                               false, phys_enc->hw_pp->idx);

PINGPONG_NONE

> +               if (phys_enc->hw_ctl->ops.update_pending_flush_cdm)
> +                       phys_enc->hw_ctl->ops.update_pending_flush_cdm(phys_enc->hw_ctl,
> +                                                                      phys_enc->hw_cdm->idx);
> +       }
> +
>         if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
>                 dpu_enc->dsc = NULL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index b6b48e2c63ef..410f6225789c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -151,6 +151,7 @@ enum dpu_intr_idx {
>   * @hw_pp:             Hardware interface to the ping pong registers
>   * @hw_intf:           Hardware interface to the intf registers
>   * @hw_wb:             Hardware interface to the wb registers
> + * @hw_cdm:            Hardware interface to the CDM registers
>   * @dpu_kms:           Pointer to the dpu_kms top level
>   * @cached_mode:       DRM mode cached at mode_set time, acted on in enable
>   * @enabled:           Whether the encoder has enabled and running a mode
> @@ -179,6 +180,7 @@ struct dpu_encoder_phys {
>         struct dpu_hw_pingpong *hw_pp;
>         struct dpu_hw_intf *hw_intf;
>         struct dpu_hw_wb *hw_wb;
> +       struct dpu_hw_cdm *hw_cdm;
>         struct dpu_kms *dpu_kms;
>         struct drm_display_mode cached_mode;
>         enum dpu_enc_split_role split_role;
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
