Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE878E374
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 01:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF3310E63C;
	Wed, 30 Aug 2023 23:48:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AA310E634
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 23:48:37 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-d746ea563f9so90370276.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 16:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693439317; x=1694044117; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KIXBc71uKxSxe6iurnFTvwcLV9QQp1uK3k3HIPwq90Y=;
 b=SBRXqF/pkmw9U1OKU0titxVC9AINwRDi0FLN4lKQX/uNNMxilIz7i5k15Wwr6LXx7l
 vKi8v9V2FSuUDkD1RMQJHVmnzinxq5obyR+5pjMtICdZQbJ51IS6zFbMRGmN18qoh2Sd
 9P1kCC/Wn8cKJI2vVqOlEn3yiin4y7vbc/dUeL/RmYMiKKDNHZlwnahRmOcDpASvGQuB
 2H+lz8C/2ncUZftpO9IrW16tXP7skVTtm7nZQLaPYCeS/J3aoIKrmyzF2K9D+eF4H5ZX
 2C0+5+R/o3V//SmFt1RfzFHZ1V6L2QeUUhGr31RUNYN0xApohcwtidIx4eXdOBClCkNx
 2PqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693439317; x=1694044117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KIXBc71uKxSxe6iurnFTvwcLV9QQp1uK3k3HIPwq90Y=;
 b=P4OhnYZJpgsMW3wHqRZ0exaX+5HEEdsDnZpjrOB5dgwQtvbJ0Ea1z+pTohy9mbOkP6
 Ni5PcHPi5NXhFn+b2tb6nDu3R4ArE9yzQUnT0AiSntPV1nKk61GFCv+BKD1Q/9zeOCMr
 8ejWj5K4yE14vIMuDjLaszXnKF4fsw6exLNLBnKA6W404j7mueBwuzzDrfCC/MddtI6E
 gkJnCNngbCAEAzct2YqGypIUECAsw3O5XamV4nBO4K2HZuIb0XsGd/Zyu+oy6H/r9bKd
 R29KWlAkQWHN0ZmVopo7vIXqd2yxRVnsG9zCXvC/x5ttDDKQI48v5raQaL7H/aeYqd8N
 8dTw==
X-Gm-Message-State: AOJu0YyP5Selhk6gorj2T3+Bc8d6hQ/iTDnqIKUiCu4oiiGcCAFuanci
 FNf4GJMGSFhJmfr6gIcT0U/VhA+Ab+GZ5tZEbcsQAw==
X-Google-Smtp-Source: AGHT+IHTzXVzK/5FqCy1xL2xl8K3p1akBKR/g7LahJuj92gVr2cLENA8eYL7vTXOPqWIdOjggJ8S+j+nCSqDTS2cWHk=
X-Received: by 2002:a25:9092:0:b0:d74:6163:db8c with SMTP id
 t18-20020a259092000000b00d746163db8cmr3737036ybl.41.1693439316955; Wed, 30
 Aug 2023 16:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-8-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-8-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 02:48:25 +0300
Message-ID: <CAA8EJpoRcdHtyp3mym5HB2A=O6V4qUNTpnMkvm+OiSt7nHuXJw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 07/16] drm/msm/dpu: add cdm blocks to RM
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
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add the RM APIs necessary to initialize and allocate CDM
> blocks by the rest of the DPU pipeline.

... to be used by the rest?

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  2 ++
>  2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f9215643c71a..7b6444a3fcb1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -8,6 +8,7 @@
>  #include "dpu_kms.h"
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_ctl.h"
> +#include "dpu_hw_cdm.h"
>  #include "dpu_hw_pingpong.h"
>  #include "dpu_hw_sspp.h"
>  #include "dpu_hw_intf.h"
> @@ -90,6 +91,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                 }
>         }
>
> +       if (rm->cdm_blk)
> +               dpu_hw_cdm_destroy(to_dpu_hw_cdm(rm->cdm_blk));
> +
>         for (i = 0; i < ARRAY_SIZE(rm->hw_wb); i++)
>                 dpu_hw_wb_destroy(rm->hw_wb[i]);
>
> @@ -240,6 +244,19 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->hw_sspp[sspp->id - SSPP_NONE] = hw;
>         }
>
> +       if (cat->cdm) {
> +               struct dpu_hw_cdm *hw;
> +
> +               hw = dpu_hw_cdm_init(cat->cdm, mmio);
> +               /* CDM is optional so no need to bail out */
> +               if (IS_ERR(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_DEBUG("failed cdm object creation: err %d\n", rc);

No. If it is a part of the catalog, we should fail here as we do in other cases.


> +               } else {
> +                       rm->cdm_blk = &hw->base;
> +               }
> +       }
> +
>         return 0;
>
>  fail:
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 2b551566cbf4..29b221491926 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -22,6 +22,7 @@ struct dpu_global_state;
>   * @hw_wb: array of wb hardware resources
>   * @dspp_blks: array of dspp hardware resources
>   * @hw_sspp: array of sspp hardware resources
> + * @cdm_blk: cdm hardware resource
>   */
>  struct dpu_rm {
>         struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
> @@ -33,6 +34,7 @@ struct dpu_rm {
>         struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
>         struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
>         struct dpu_hw_sspp *hw_sspp[SSPP_MAX - SSPP_NONE];
> +       struct dpu_hw_blk *cdm_blk;

struct dpu_hw_cdm *cdm (or cdm_blk), please.

>  };
>
>  /**
> --
> 2.40.1
>


--
With best wishes
Dmitry
