Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD3A04DE7
	for <lists+freedreno@lfdr.de>; Wed,  8 Jan 2025 00:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7241010E40D;
	Tue,  7 Jan 2025 23:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CyAyjVAu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410110E415
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jan 2025 23:51:51 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso353803e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jan 2025 15:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736293850; x=1736898650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
 b=CyAyjVAuGwJKg30IBkalmua9yue2ZKRpznAkCtVsWY/tSNKQlOSKkB6m92mDGIcVhV
 jAYcVhclNKu5Qm6r3aI9IeY71Dl581o7l6QzN9KV0YES5pcX4jtI825Y9IavFcFzhcoN
 nRUro9CLREzxK6J9nnpQvbY8zS7xJs1xbmrgfPn6Pvl/86g/7MXfrTk/LxvEvSTisOzF
 Az4Wxpt6CCnUtkpzv2Sa+vOK8PgnniqeZp+/O9+8+EOIrOlKpQE0H7UiiR0hBYeg/J5F
 bSOwkz51cO7MSEESkFS7yXEAVIF3jX8araioEiSvb+wkQQ1KasPpT2yU/HeTKqZoD5vc
 EerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736293850; x=1736898650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mzA8ULDWK+L6lzlTxbv+SOWG/fbWpGETGTXU33lZ5cE=;
 b=g555F8MKbgMaWArYa/raQ3Azk60SeXSaa55tGoFqyoAKMFeLOArvu1u8wjaFdb+9IB
 MlAMBtHul9uRrAq1LiYI52w+8R5b1e12kJw/Pl1QZcIyMAfkR6Qca7CDkBrXQW+Juzt/
 4JmcTb/3+WkkH7ixT2//X/8WKWh/mXdkGUz13yG+aMJjB4G1q8snqFhGc72fdzBq7KYm
 RFD2tQjcwrfm2ftdq8V6yC99XyFvedMcvF2FjVRpGjTfAaAA/fpPcApKJc8XmRsnlxWE
 5g1THfrHpQEbcpb7oCCg/vr6SPirBfMoPLaJ7h+CuHV8DXd0tts64uzlc/Bjkrs+n1vA
 1+cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqjKK5bPP4+cLlFQBsmfuMxQv38JLJpf15yzS1IHKpo3EtsQwtJXZ4G23AIdrQgt8mNjhfP6aGPlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRnWEYHmO9N2XQMs2BOmUE4XFdKDjhYsPcuqJJs8ZSkRkw4ihd
 t9N158v3pFOMraxkMq3R6x3ivLVe+FTNQH8+a1Cj8/A9s/yhW1N5Fu78NCB8kbA=
X-Gm-Gg: ASbGncvTF8FGTnY50O8By2vQuIkUZUSYCm3Gpgau/RToux37dyAkUWrWWeNZLLbTFUn
 QazlbrksYJ5+5PloCAjS5OohzFMTGfRjCknoMcwKDcTAV/8X79VIYjZCzrqSmaz/lJr9nVaOqk6
 XhFI5MBi1aHMdXtEfKtHxKZSAHppbwmyJqSHkL4lDz/f+RsMLtmgkr0tOZgton06Mvi3doXdSfx
 OuMSr4V7nzsXl2zzpXsgvU8wX5RV/P3V+GkosZppYydpTQYsXaUjgVZq2kdLlzbmb5oQArJLc5p
 F3qrCNxFbBrF7fs+DpFDjd6t
X-Google-Smtp-Source: AGHT+IEq/n/Tfq7aT4FpmCEZdmi1g3GO0mqtL7fWEuY6dUSLlQYwrreN3n6ytarFegj9TLUJkrf0bw==
X-Received: by 2002:a05:6512:334e:b0:542:7fb2:4098 with SMTP id
 2adb3069b0e04-5427fb240dbmr964465e87.26.1736293850322; 
 Tue, 07 Jan 2025 15:50:50 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5d5asm5409976e87.45.2025.01.07.15.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 15:50:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: Re: (subset) [PATCH v4 00/25] drm/msm/dpu: Add Concurrent Writeback
 Support for DPU 10.x+
Date: Wed,  8 Jan 2025 01:50:46 +0200
Message-ID: <173629378661.1569938.10235663597211043453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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

On Mon, 16 Dec 2024 16:43:11 -0800, Jessica Zhang wrote:
> DPU supports a single writeback session running concurrently with primary
> display when the CWB mux is configured properly. This series enables
> clone mode for DPU driver and adds support for programming the CWB mux
> in cases where the hardware has dedicated CWB pingpong blocks. Currently,
> the CWB hardware blocks have only been added to the SM8650
> hardware catalog and only DSI has been exposed as a possible_clone of WB.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/25] drm: add clone mode check for CRTC
        commit: eee0912a7185d5dc0a700d48f7ff620bb7f5389b
[02/25] drm/tests: Add test for drm_crtc_in_clone_mode()
        commit: 5a6e8c369486a79493ab300a1987cc6aad16cf6a
[03/25] drm: Add valid clones check
        commit: 41b4b11da02157c7474caf41d56baae0e941d01a
[04/25] drm/tests: Add test for drm_atomic_helper_check_modeset()
        commit: 88849f24e2abba8a8951aa76ea60a72fba916afe

Best regards,
-- 
With best wishes
Dmitry

