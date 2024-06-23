Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1717913888
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989BE10E0FA;
	Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zyB0Xd6o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113410E0D1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:16 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec002caf3eso47396951fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126854; x=1719731654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bv3RmqBzxRumknsNv7kNaxp5ef1fpM+tuKvMs4Mga4c=;
 b=zyB0Xd6oVy15CmqBOKWN4h1opE6BEeTtb0b8x6NKXBVtxuRe02s5B+fXIyUS+OWVwY
 2cHJWPemDUk7D5R9iRlyVsbcZZcPvEl3wvYDifU5gaMqr9p9K/vFVP9Kqfmk4Gw+SiNQ
 KWhs3r+LZzyyAUz0JeL6BHarxqvUpWxwHY06yL0GbM6/cZRI4SSAmnEYxVa8ppntKUW+
 FWyj7buO57zzt66ZRyChG2qxC+U1q9cBO4VChDZvzEeHluyQW+lOpWaXNEYABcgPf2+U
 tv/vSYTdjqYsC6yZMMbV6eGwdpkdzj8/HrivV0JWgUXnZ79fWFr13pMBhlZNw6xziKNK
 XK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126854; x=1719731654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bv3RmqBzxRumknsNv7kNaxp5ef1fpM+tuKvMs4Mga4c=;
 b=SLJl1UiVGK7XujVnC1xtrPkmoKsxxMpnAEecKgwJTrnMO/Uatw/W98jlgYZ02iQjJO
 f0VULlnyRtffqlMOZEGu674F/QT6wuLPUtCUPXyvwtJHt6JOAiDOLi7ET0ih6pmmm2zb
 9cmw967LVlzWIFqzbGHdED2ufjMv9Nb1zSluXsnjCIBjlyWPs2k6Hk16TFvuEiaEOfWV
 NRvSd8CxcRU3Ho0of5sWI82EnhxUMiYaNDTKTHA8tfOW2TH9A05r7sLf1iGp8DEKwEkx
 QACunDDYQ7gxYB8p2RY5BmczIgD9VUKhZGQdxfpTWeNZail6CsXKXTn/3+gQrdwSull2
 bvMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJNgl5JRuMuoWd6TyiakgbRSrCibcuOzB+g6327xTxbZ0qxfdwSecBvgGfMMCVRV86pDOFhT6KPeQapC2134RgdpjIhOQh0gTgwalzRHpt
X-Gm-Message-State: AOJu0YwKqPAkiH7LRirFpBmj/ZZ0dLXZdcpUg2FS6IlcAZss+CBA/WIG
 3yZQgIv4U65r0agdgiRvFMwgIZRfr/5jxHMyYCwdvwoVvSLemObI5uA7/rzYbaI=
X-Google-Smtp-Source: AGHT+IHVCwjM8471lU/ehMDgW/YT4M/SicFwOJ1D/s5IwFxGRJ9Q7jeIscRmJofRYLPSnsakpvTTBw==
X-Received: by 2002:a2e:86cf:0:b0:2ec:5a6e:7771 with SMTP id
 38308e7fff4ca-2ec5b31d1b6mr11292671fa.37.1719126854458; 
 Sun, 23 Jun 2024 00:14:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] drm/msm: make use of the HDMI connector
 infrastructure
Date: Sun, 23 Jun 2024 10:14:06 +0300
Message-Id: <171912674295.840248.12157846241927511158.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 07 Jun 2024 16:22:57 +0300, Dmitry Baryshkov wrote:
> This patchset sits on top Maxime's HDMI connector patchset ([1]).
> 
> Currently this is an RFC exploring the interface between HDMI bridges
> and HDMI connector code. This has been lightly verified on the Qualcomm
> DB820c, which has native HDMI output. If this approach is considered to
> be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
> Audio Infoframe code). Other bridges can follow the same approach (we
> have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).
> 
> [...]

Applied, thanks!

[4/9] drm/msm/hdmi: switch to atomic bridge callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4fd10fa0b573
[6/9] drm/msm/hdmi: make use of the drm_connector_hdmi framework
      https://gitlab.freedesktop.org/lumag/msm/-/commit/aaa38235b5fe
[7/9] drm/msm/hdmi: get rid of hdmi_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/97d6442e8f9e
[8/9] drm/msm/hdmi: update HDMI_GEN_PKT_CTRL_GENERIC0_UPDATE definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/917921a20294
[9/9] drm/msm/hdmi: also send the SPD and HDMI Vendor Specific InfoFrames
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf28d52a20b1

Per discussion on the mailing list, 5/9 is deferred.

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
