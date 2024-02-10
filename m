Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317858503AD
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EE010F4F4;
	Sat, 10 Feb 2024 09:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gROZrDXH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39C410F3E5
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:37:26 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1290438276.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707557846; x=1708162646; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
 b=gROZrDXHCVG9NUtXrQIdCvDQW9rv+8GyAhoQbRopFWc0cCSkXp9xIZN5JDCK+qDBPk
 ii/aDlr0eUEmlnNmNqt6DWELbF8D5S+xbfW19mfNYnZcKHGOzSjCiGOdPJpqNFDRi3Hz
 DJxbaK/x7qzmk2TpnnV0QPJGu6VIJLbDuOhLoUnHDxnDAr2KOpKYmtSJDGFKG2AKm5GQ
 XLNPEJ7YCLiiGklo5GbmxwU4pe6q6yw6U32edi+xs8peZaivVdWKcPhSM8iVa3euwUHW
 rKMdDIA5DL583gYqpoP1fDaf2Z5pWUxmG+W/8YMFfSpUGj5mrjwAKLn4AjdXqx1K1uB0
 3TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707557846; x=1708162646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=traMzP3X3ap8UfhwxLc+Vo63DS4xV+/qhFdckzPcq8g=;
 b=JVngOBeX1DLVFSVTlCd6Xpvsd0hwGjegyHgNAGhRv2pdmEtTtjD0Bst3zBBq5IsVLz
 3kqaQnYUlY9dpmdEWSKH0Vtq6afbkiQ22Ky7YbJ1CmVH6nzNXwgKb9ZlXTQ7mBGCUtcA
 /zpJvo8HhlKGhabtR4vAGyRVSHvXI2s+50FxjhQyrAWzbVuQ8Hhej9hQnorPEbCSoP97
 F8tOPixhy+j6KIpr4gP8WgwPMG2Pf5JWE+3Yq291x/skp7Vp4bTJmNzCoWRW2ORbyl9O
 eoZsa/0U0lHeFdtz8CgKOyKHPyUVN/M83siKJvyhXcY6krnmHj7yaRjDQa1NlrZpMoZ+
 thZQ==
X-Gm-Message-State: AOJu0Yyi9a2yToweStAfmWZaxMMuqrM6gcpd2elxtMMLLKhk4SQNRZlF
 j02HhWjVEpIGDx0/FPBFCB60aYUoPw8x260x1efV3AWH/EfLxsZouud13uzzMR5S077IoPcGTAI
 YU9B9cyNtjemy4HAn7K5lXKivu+DsYlssa+WUKw==
X-Google-Smtp-Source: AGHT+IF6CfRLisdVWfw44qvUlYpfj1ay0gD+tPXDhRLqsK2QrMb/MELbcxS5tQsxDr0PefjjkG/NJ46XbAkjEJ5+HGM=
X-Received: by 2002:a25:d348:0:b0:dc7:43bb:51f6 with SMTP id
 e69-20020a25d348000000b00dc743bb51f6mr1365579ybf.7.1707557845977; Sat, 10 Feb
 2024 01:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-3-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-3-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:37:15 +0200
Message-ID: <CAA8EJponSr=EgVe6m-KBWxvjz1bL-0Tczj=fGKZZrevJ3DZzbQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/19] drm/msm/dp: add an API to indicate if sink
 supports VSC SDP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> YUV420 format is supported only in the VSC SDP packet and not through
> MSA. Hence add an API which indicates the sink support which can be used
> by the rest of the DP programming.
>
> Changes in v2:
>         - Move VSC SDP support check API from dp_panel.c to
>           drm_dp_helper.c
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 21 +++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index d72b6f9a352c1..c6ee0f9ab5f8f 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -2917,6 +2917,27 @@ void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>  }
>  EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
>
> +/**
> + * drm_dp_vsc_sdp_supported() - check if vsc sdp is supported
> + * @aux: DisplayPort AUX channel
> + * @dpcd: DisplayPort configuration data
> + *
> + * Returns true if vsc sdp is supported, else returns false
> + */
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +{
> +       u8 rx_feature;
> +
> +       if (drm_dp_dpcd_readb(aux, DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature) != 1) {
> +               drm_dbg_dp(aux->drm_dev, "failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> +               return false;
> +       }
> +
> +       return (dpcd[DP_DPCD_REV] >= DP_DPCD_REV_13) &&
> +               !!(rx_feature & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);

Nit: we don't even need  the `!!` here. I'll probably drop it while applying.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +}
> +EXPORT_SYMBOL(drm_dp_vsc_sdp_supported);
> +
>  /**
>   * drm_dp_get_pcon_max_frl_bw() - maximum frl supported by PCON
>   * @dpcd: DisplayPort configuration data
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 863b2e7add29e..948381b2b0b1b 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -100,6 +100,7 @@ struct drm_dp_vsc_sdp {
>
>  void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
>                         const struct drm_dp_vsc_sdp *vsc);
> +bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>
>  int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
>
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
