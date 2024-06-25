Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854D9916B37
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 16:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBD910E6A3;
	Tue, 25 Jun 2024 14:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5+zcaIg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EED210E6A5
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 14:56:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so65329331fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719327403; x=1719932203; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
 b=f5+zcaIgQDhc4aLqEhaLi3nw/10vKa4W3BjhP0CzeBBpwvl/m/+UtY9UfJqQFvaQVb
 bNCPHrJfrufOvZnvZI9fHs5xyCxyCEZy388kMTGCC++Qwm7S6IQSCA0Mo2+3EvMkQmfZ
 3D3l0G4SszCN1YLQNpKWmXTkfwHAnvX7ZJVusrm7K6YepKg9/dxXAqZmExGNue7VLfZA
 qunpazmWyNYLYtZLWuF/2HiIsfu2UAslUVV/XJir0bGswCnocHCg3v8t8rOyFJ9AV4SW
 uL7SlXQlMctMKR5cicqLynEYLdBgZH1P4bLByhM//bnpEgfb2SW7S7lv62Obt7lA9G9m
 MDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719327403; x=1719932203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YoReR8WhxNYuufCEGKkuq94jgMfndxltW+YaaMCsVj4=;
 b=xBvn1GP+xaHkN79cvGNSA4GiGOYMMAsq4vXaJImpQCJ7d8ycMaXcRyaSLU1PUHlYvL
 mtcFAqXn7YZI0hZCZmrr9TAy+MBgBVoYtO3ZUh5wAVR9x7a5yFvI/jNzIWAUsjDu468J
 7ssV0rpw3+qW5NF1vokVn3KihlX4Ndltfj8EC/W6YHZJDgbIRqSABB0aQa0cnOp6P6uz
 DgsLq4poGbX5ZWK2WxLfokVMQ7mGAJX3i9DEonGTTrb6EyTp2SEnnQS+Nglahqq/vj/c
 b5W5qQA+P1FzV3cDOYtwtnk8L2PaXug1RDOBCWbXGOKrsio3ujXlue1WPeDhu0Jlm3Ak
 Dq/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8Z/tqhtQLTzPxqSqJiprH/Zix1lZc4jiTPt1bx4BjQ67wTil3bRHhvb+GkRge1isXnlmZ8uUTV12aE49FK6E/lKsPnQjc1bwyWidUqRRU
X-Gm-Message-State: AOJu0YyygwtwN1NT7SsZDS13PxuJ5c+kJhltN+W6/Ra10Vhh4Dbntq/m
 DmkXAof8iu0xnwhaBopkOb47KWUjySK8VwTUuoKrS/6XmBjm2f7N5qJBqDv8ThkcLj0SPRwmzUK
 NUtw=
X-Google-Smtp-Source: AGHT+IFXgEFFBEekYez/olxWlhZlgktM2joEiS7S4E8YauuUuTtTSsmoGuQvl2CGNP1XEWUsmnVA2Q==
X-Received: by 2002:a05:6512:3c82:b0:52c:dbe6:f5f9 with SMTP id
 2adb3069b0e04-52cdf7e6735mr7608853e87.12.1719327401997; 
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd641f655sm1257321e87.162.2024.06.25.07.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 07:56:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH v2 0/4] MSM8937 MDP/DSI PHY enablement
Date: Tue, 25 Jun 2024 17:56:39 +0300
Message-Id: <171932736812.1437673.1282826360877883479.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
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


On Sun, 23 Jun 2024 22:30:35 +0200, Barnabás Czémán wrote:
> This patch series adds support for the MDP and DSI PHY as found on the
> MSM8937 platform.
> 
> 

Applied, thanks!

[1/4] dt-bindings: display/msm: qcom, mdp5: Add msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c94dc5feb494
[2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/13099cb03f98
[3/4] dt-bindings: msm: dsi-phy-28nm: Document msm8937 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/60bdbaaf1220
[4/4] drm/msm/dsi: Add phy configuration for MSM8937
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2df0161959d1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
