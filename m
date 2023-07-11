Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3F374F1DD
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8D410E3B1;
	Tue, 11 Jul 2023 14:22:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48E410E3B1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:04 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b6f943383eso91881101fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085323; x=1691677323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
 b=r0v+ygSfzimP/KLRdLbKaY6CMkxtZVxhReFrhft0vSI/Nvuk2cRuxud72IbafdNu9B
 81poxleuZvfFmfxzykbgjux9VjTCzmAyTQRaMRk4myVDAwhmc4jP0CWqOcuV/VJLIEAo
 9W4cjEDrBm8tVFhnrvtPEG7Pak7wHsk3pDmpv1OJZ6nrb8t0TswD513rzYIH9k880cYi
 YC69AkBvuuM82vnExcT62/Jjb8SFDGySH3O3JMUuLCDCvD2OaOS1n+74xbgwhSZ7+vAC
 l78egxP9CK+Fzo16vvQ7J8esIz7wARIaI+goy3PH5xywbvcKFGm3WAF98BFBZZ86/W+8
 zOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085323; x=1691677323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ik/qOyICB+hOJlY4lmFAhBvArnDlT8QyNux/Uwz9Gbo=;
 b=gizKJopaMzF9fHrlzP+cRvYQ2nfnRklJk9qI0aadAun+QB3Kfe7ZaGuOmh+99h7XrC
 BLBvOdmJNAT5m4IGPNDNQ45YrVImb84lxYFUenNXkPxCTraIcdL3D3SihdlYcKNur5np
 qvNx/WU8RWXjkl67sT0D6WjqsZkrV1aBd5QIx8w+qFbIyS4kimKl1oPxi+fpO3BuQceR
 nE3wiKOqYH5ILQk7KzEioE+9BUHFTgRmlvNXLaa2UW1vvtAEXbAx+nuT+4xXT4dwcUrm
 +ddvM42HXZWZg6WU9nbvxGxEDTpLUfEphLymr6YrD1Q2sxmgU54wdTAp22t3FyEdp/na
 o+MA==
X-Gm-Message-State: ABy/qLZFpj2YgTwOLUSWNuXpDdZ+9wAox3+Dz21/azTk08zZG9xtKSvV
 yyHPZx3wiGXKalWRa5Doa0g40Q==
X-Google-Smtp-Source: APBJJlEBalRUj+ijS5CyMwGZ73deoQ4XRunAyY0wJowOTqWQavAPcjIpA36nSTndCOGOxWS/74NRxw==
X-Received: by 2002:a2e:8611:0:b0:2b6:daa3:f0af with SMTP id
 a17-20020a2e8611000000b002b6daa3f0afmr14149206lji.25.1689085323017; 
 Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 11 Jul 2023 17:21:52 +0300
Message-Id: <168908465039.1869384.13751958187068298061.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
References: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Enable BURST_MODE for
 command mode for DSI 6G v1.3+
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 13:31:45 -0700, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dsi: Enable BURST_MODE for command mode for DSI 6G v1.3+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4ac447e89e71

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
