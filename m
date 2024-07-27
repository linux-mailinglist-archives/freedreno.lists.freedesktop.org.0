Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A92D93DC84
	for <lists+freedreno@lfdr.de>; Sat, 27 Jul 2024 02:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEC810E090;
	Sat, 27 Jul 2024 00:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="E4o4mQ1u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5090810E090
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jul 2024 00:24:37 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6b7a3e4686eso7949336d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Jul 2024 17:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722039876; x=1722644676;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=07ogrVS5x8lpQcrfQ9VX3T1kjP2RfniPU+x1JGxiSQI=;
 b=E4o4mQ1u5ypJvWZ0jWx9xg35WbJfLJYU/4LGMW9LrBZWlI3Cnh1COTN0/1jemQFDVe
 KsSzPUpXluDmSFRlUBWf6ndG/xPy1ampF2tDnwyeJLFi2P8VSzbC1L+AdvKZVQlYhCfP
 xYaebMsZVZjt9h9NLyiDR3gUyMt3NKNQKRbd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722039876; x=1722644676;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=07ogrVS5x8lpQcrfQ9VX3T1kjP2RfniPU+x1JGxiSQI=;
 b=ZON0G/olU3EbpelKQVWme+bI6BUCpA4D0f3BNvLjNPJ/I8I8TUtPbFKbZrFykj1nRp
 4A62Zbwq6GF2S5/kKQyZNPwnBURNlgVPqoPdg8AU+SqF8nH23Cr3BeOVQcGi/rJ2u6OS
 wQJF0AyQh2QklkhIbwEDQTh4YSZVg6UxIgf2xiZJE1hWArO//N1Wn6oSn5HCYmVnpOM5
 B8MN+ijpwC4cTLYYZKK3VevN3DzpyIL7hCE0ldQercgrwjzlUrz6Wo9SMSW9cFltddhl
 ZSPYwAx9vLw32CaEw82sP6X9TWOlTFbMVDDwXXz/gjK6KDF+FQ2DDQ0Ht6MYibWZBoGt
 SI9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTK8vHdvilaR9ccfZdIm2v9KNswfYCHk8ETCDR4aUGCMx9LbfKHRXMQHB+mQciZO82cQlTJw7xuSz6j2nbgR0D1esbDqh9rECbP0Jxfcrm
X-Gm-Message-State: AOJu0YysnoTuiW0fNAHuCYjOVxhQ4jq+IJRTyX/wiLx67M7//51eG7RY
 k9LQnogbQsJpwylSsgeyNyINq13wHPLn168v2aMtIwCOKdZYIpZD5M9ejoWhciDVMmqQKWy97Xb
 2lSJzkcSpKL5CyPESBC2YkbKAWC4dUIkfeUYp
X-Google-Smtp-Source: AGHT+IHpnZkC5VzVD/9wtOuDbyMsVbJocHHwdfZb7aYI9KRRHqHEMH/h3Uk7GOcJxPPS3XvCEOHVuSYaA8p7WV7saKw=
X-Received: by 2002:a05:6214:19c7:b0:6b5:6b1:6c with SMTP id
 6a1803df08f44-6bb55a1533dmr19000576d6.24.1722039876063; Fri, 26 Jul 2024
 17:24:36 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 17:24:35 -0700
MIME-Version: 1.0
In-Reply-To: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
References: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 26 Jul 2024 17:24:35 -0700
Message-ID: <CAE-0n50mBEX98HH+5BurM-uRyzrxcPXFJ7yLg__hFJHfYjm67Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Guenter Roeck <groeck@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <quic_varar@quicinc.com>, 
 freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 neil.armstrong@linaro.org, abel.vesa@linaro.org, quic_khsieh@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, Chandan Uddaraju <chandanu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-07-25 15:03:19)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a916b5f3b317..56ce5e4008f8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
>                                 drm_mode->clock);
>         drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
>
> -       dp_panel->dp_mode.bpp = max_t(u32, 18,
> -                               min_t(u32, dp_panel->dp_mode.bpp, 30));
> +       max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
> +                                                 dp_panel->dp_mode.drm_mode.clock);
> +       dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);

Is the max_t() usage still required once 'max_supported_bpp' is also a
u32? Also, what is 18? Shouldn't that be some sort of define so we know
what it represents?

Or maybe none of that is required? From what I can tell,
dp_panel_get_mode_bpp() calls dp_panel_get_supported_bpp() which will
essentially clamp the bpp range between 18 and 30, unless
dp_panel->dp_mode.bpp is between 30 and 18 but not divisible by 6, e.g.
29. Perhaps this patch can be included and the max_t above dropped.

---8<--
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
b/drivers/gpu/drm/msm/dp/dp_panel.c
index 07db8f37cd06..5cd7c138afd3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	struct dp_link_info *link_info;
+	const struct dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
-	u32 bpp = 0, data_rate_khz = 0;
+	u32 bpp, data_rate_khz;

 	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);

 	link_info = &dp_panel->link_info;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;

-	while (bpp > min_supported_bpp) {
+	do {
 		if (mode_pclk_khz * bpp <= data_rate_khz)
-			break;
+			return bpp;
 		bpp -= 6;
-	}
+	} while (bpp > min_supported_bpp);

-	return bpp;
+	return min_supported_bpp;
 }

 static int dp_panel_update_modes(struct drm_connector *connector,
