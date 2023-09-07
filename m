Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC10797E12
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 23:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563DC10E7D7;
	Thu,  7 Sep 2023 21:46:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C2110E7D7
 for <freedreno@lists.freedesktop.org>; Thu,  7 Sep 2023 21:46:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-500d13a8fafso2408461e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 14:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694123184; x=1694727984;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=0aJKWXfzmj6u8YEdkpXnNHt6AfonPZoyqL0Kn8VibLM=;
 b=QBQL+KoWZiLkV0SHzAsKQD4yzTPxExzctyizYtEURErdH+PMkQk40JFzW9ZogJFP0n
 wW5mhGah/b2DpSLL9lInqG4VAAmb0EnxIVrG2gqIIi6orzUXrRyPST+SvOpd14nHs2q2
 dPNGQKedc/IZqGp1BycWRy6JNFUUYzyWXB0YI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694123184; x=1694727984;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0aJKWXfzmj6u8YEdkpXnNHt6AfonPZoyqL0Kn8VibLM=;
 b=DHfSIZHBXhB/ZB9NntK+8AY3ASm1LtUQt0wmVLUlAFSe0VpgIpLZJihuBTqtJdZJ9N
 ZWKW8JXctgpvIX0rxkoGf6P63avvxRkL+nVZ5+0qMoBDeVVx24dAyXok16DZUzpsQtsf
 zHnZUTZGn+PpjD+Z7cVefTv5QZs+sqyHGRx60dMB71qXm++3cNH6VcSvzgUMbc4rNYx1
 Yq330BQecLDb3P+BYqAJ2iTRXB5mAkM+9b9EJLeOeBinY+5O0GoLbh1KG9HQEvd5PNIW
 +KGglY3xfEvCV3RUEb5kSHh3Nw0tj+VCEWRpai66HVAwJNF9/y5tr8sXgP6YWZwBK2hZ
 0GZg==
X-Gm-Message-State: AOJu0YzE2ZowCFoWAgrRRd0OGG6ZamYN2vwOoxgfIO8ds2SeRnxZgRxh
 rFab4zU9YIDy9jRzwveWauE0f8DduMgpflI8aNLGBA==
X-Google-Smtp-Source: AGHT+IHCYUG2aXeuH8XR1/58/wZYVhoOZXlsf/DM1LN42R4sD0m7j2f7XInEKVsOAn44UvBmdusGotPNNdkAxrXQ784=
X-Received: by 2002:a19:500f:0:b0:4ff:a02e:a53f with SMTP id
 e15-20020a19500f000000b004ffa02ea53fmr435355lfb.52.1694123184093; Thu, 07 Sep
 2023 14:46:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:46:23 -0700
MIME-Version: 1.0
In-Reply-To: <20230901142034.580802-1-jani.nikula@intel.com>
References: <20230901142034.580802-1-jani.nikula@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Sep 2023 14:46:23 -0700
Message-ID: <CAE-0n52T4VGVVKqZCJwhpxe=vLUb7WNi=J0hdsHFOqA95u-Ymg@mail.gmail.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: skip validity check for DP CTS
 EDID checksum
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2023-09-01 07:20:34)
> The DP CTS test for EDID last block checksum expects the checksum for
> the last block, invalid or not. Skip the validity check.
>
> For the most part (*), the EDIDs returned by drm_get_edid() will be
> valid anyway, and there's the CTS workaround to get the checksum for
> completely invalid EDIDs. See commit 7948fe12d47a ("drm/msm/dp: return
> correct edid checksum after corrupted edid checksum read").
>
> This lets us remove one user of drm_edid_block_valid() with hopes the
> function can be removed altogether in the future.
>
> (*) drm_get_edid() ignores checksum errors on CTA extensions.
>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 42d52510ffd4..86a8e06c7a60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -289,26 +289,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>
>  static u8 dp_panel_get_edid_checksum(struct edid *edid)

It would be nice to make 'edid' const here in another patch.
