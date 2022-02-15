Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FC4B6FDD
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 16:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05B210E63C;
	Tue, 15 Feb 2022 15:38:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D68A310E63B
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 15:38:56 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so23633073oor.12
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
 b=TU+Z3LV0OTJmXTcz5t0PoFnUR7njNtbMnOQXcjnG2dnGd2Bg8aZNe+3GdsUYJCrUN/
 VpWNVZwOyfs/Jq6deASO/LkTWy7ltrhyfBUffXKevYiJseRsfvW15fY8iueeP154lVU+
 ujbSVOlVJEe/DONvxxT5RjK4vLdpr+TrvOe6bimVi5KNvQegpHhr1mSha2oBBwL+nhbR
 /cNVZ5+GJBAHw2A3O1/T1278Tp84hEg+yw+NPlNTtc4STYys+gPVar4xvIPbU4Yj9iuw
 ruuxK/6GQp9btXHgyvwHBNR0ahRcpvS28Y8LdrYFViMK5DhG3EdE66jAOW3yqPjKDdga
 lDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
 b=nhhS+RcW9w8k3NVbGGNV9ZYgnPSrXtAt/teCkUQlh31d2jOku0ideddGwAmmzb7GwD
 c8AGS7iAfctrgDuu7kUeNiHvzio1ISGhmMyNHp1lKaW3P04xn+j0sBiTkWRpugL/BbUX
 NRH9BIVwTa+uhmlI5yigVKVYhf6McVBL8pstygQA2K0TiU1VeXU/sXuBOPa7dBFTDFsE
 eeRjaKvsBj+OYY/D72/16HLlvAMrwvHzVwqSO7CcudJ/OzwVxRs2cPXUhHfEIxpWhijY
 g9/MOQOYEMu4bfwM3sV9Hn2T0waCwmZ30n2wu5TageDqlUbykjrw9hQ38m0xPnhyNe1g
 LOaQ==
X-Gm-Message-State: AOAM533jV1Q0DXHNZyl1ImJa+JXo7nqKpYMKLBq9jxVCGWHKm0LWVRn8
 OYRvWDoR1dr5y9z2Av07S2jyrA==
X-Google-Smtp-Source: ABdhPJwniUUrFyPY+itLrwf9hGIBFcNHVJBm03Um97xeABEfXlO/Cld1YQuGI24h53YLl0d3lJg+mw==
X-Received: by 2002:a4a:4ec6:: with SMTP id r189mr1430542ooa.31.1644939536187; 
 Tue, 15 Feb 2022 07:38:56 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id z4sm13758586ota.7.2022.02.15.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:38:55 -0800 (PST)
Date: Tue, 15 Feb 2022 09:38:53 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YgvJDVHYfuns03W5@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client
 field
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 401e37f50d54..480d02ccff8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
>   *	Virtual encoder registers itself with the DRM Framework as the encoder.
>   * @base:		drm_encoder base class for registration with DRM
>   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
> - * @bus_scaling_client:	Client handle to the bus scaling interface
>   * @enabled:		True if the encoder is active, protected by enc_lock
>   * @num_phys_encs:	Actual number of physical encoders contained.
>   * @phys_encs:		Container of physical encoders managed.
> @@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
>  	spinlock_t enc_spinlock;
> -	uint32_t bus_scaling_client;
>  
>  	bool enabled;
>  
> -- 
> 2.34.1
> 
