Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6804C803639
	for <lists+freedreno@lfdr.de>; Mon,  4 Dec 2023 15:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF9D10E26B;
	Mon,  4 Dec 2023 14:17:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B0710E1E2
 for <freedreno@lists.freedesktop.org>; Mon,  4 Dec 2023 14:16:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c9f57d9952so21777161fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 06:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701699396; x=1702304196; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
 b=CYxvANpQgvOe2msEQpHctyhmWuTT/2gZahKogPLeuihnNBdtd7Fiv6odGjxZL++wE/
 fSCo8enUiQTuCVioVYLodunKdBdOQe9Sa8WCo/2vI9xcGfk3y4my18/mo2Yhi1+T6VF0
 9ZKgyCR8QfMceq1ygLN5t+XflOWUSPzL7qgTlraffOuGL69U+HdVVbVmaqxqdaehSvKI
 BNigItRKux7QfhZpK+xLEcAWtg0BUkq6n6gYb8P7zAO8YJPfNGoKiEA1gXRZfztApGiS
 JZVZDXJ/ThKlQ5MKYyz2BpBCTWMjv1NnerV9oD/oWqwpcwC1xckGGg9p0kOYZNweP3rA
 foDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701699396; x=1702304196;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tnNKn8nu723Lg0zpF/kv/3F1mKY2Dj8RO/b7j9k36Wk=;
 b=wS2M4Xj5szTZa1OFOHhGg/Ia87nEDY3p5Rvidza2k6QJC5diXX5isZj3UStR+VrdaJ
 Ka42b+s3QjDnsM/4ZMqt2VqIEEopkQhsEgJ+g+IuHjxachHidWI4Xyg82xIs08vSso0+
 IcPtAmSEm+8AYm2BylrfNc3llsU6urn3VE2aRVdqClWTYHnswkx092EXT6FrTlxMBdEk
 JgLkErPVBI+wjRNK/qTw4nvPQ6xMJAsmamZszqx0KacOP3oMD2p5HR8lyprIedakAB+W
 eUc8+aSzYgcYA9zBNbIdaleTXsA+Wdy1FkG22zWD2g7IhYmS0EJLqwsPNnn98jrsTf6v
 7FSg==
X-Gm-Message-State: AOJu0Yx4RwwY9qwlNgypMGLabbCIZRjmywzpf9JUETBB1Hf4h8z8JE9B
 gDM0yMpr0TRQtdG4fhOYA72j4g==
X-Google-Smtp-Source: AGHT+IHddUgNiM5+JeDrcniHCScJhE7jly22t2q9+rXWr3RDXN6X9hcnxXrPXIv6LuNWyNWoqwMFJg==
X-Received: by 2002:a2e:8041:0:b0:2c9:d863:2c1c with SMTP id
 p1-20020a2e8041000000b002c9d8632c1cmr3034669ljg.69.1701699396066; 
 Mon, 04 Dec 2023 06:16:36 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::227]) by smtp.gmail.com with ESMTPSA id
 v3-20020a2e9243000000b002c9fda71acesm487033ljg.127.2023.12.04.06.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:16:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon,  4 Dec 2023 16:16:30 +0200
Message-ID: <170169936705.76859.13553998311101543980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH RESEND 0/6] drm: simplify support for
 transparent DRM bridges
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 03 Dec 2023 14:43:27 +0300, Dmitry Baryshkov wrote:
> Greg, could you please ack the last patch to be merged through the
> drm-misc tree? You have acked patch 3, but since that time I've added
> patches 4-6.
> 
> Supporting DP/USB-C can result in a chain of several transparent
> bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
> in a different way resulted either in series of hacks or in device tree
> not reflecting the actual hardware design. This results in drivers
> having similar boilerplate code for such bridges.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/6] drm/bridge: add transparent bridge helper
      commit: 2a04739139b2b2761571e18937e2400e71eff664
[2/6] phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
      commit: 35921910bbd0b6ab595cead16d0c8faadbf2fd94
[3/6] usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
      commit: c5d296bad640b190c52ef7508114d70e971a4bba
[4/6] drm/bridge: implement generic DP HPD bridge
      commit: e560518a6c2e60f1566473c146fddcff3281f617
[5/6] soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
      commit: 2bcca96abfbf89d26fc10fc92e40532bb2ae8891
[6/6] usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE
      commit: 7d9f1b72b29698e3030c2b163522cf4aa91b47e9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
