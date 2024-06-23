Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12A913885
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4083C10E0E9;
	Sun, 23 Jun 2024 07:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v5YQBCkI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984BB10E0E9
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ec4a35baddso28518891fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126853; x=1719731653; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h25hTtE3iszL243EN3L/BanznYfr4S4AGkpe+1b60ns=;
 b=v5YQBCkIoXaaxQTaeSzi5a1Hz7+PXIokrs7E2ZbC7F6YBz7RPDrEFOaIlejsNNt+f+
 i1JnCKa0IJFyoVEUg51AzSEvIPdOx2987PJJTlehqBch1Ew9IrVoYZaruc1rJQVouPsN
 dv6Swde4QItpjvnqyeqblPuh2pqfzGEGRVWsqVuE78On17/pDFeD/sRPYfX/nnF/irCx
 atjU+VWSRLCyMBO499w9EJZLOhoDRo718JRx2VMeOAXBgwIAt8hgxM9800o+lykvNPb9
 l5zIXoMxRAXiEuh8roMjKQyGwW+9W0jYSFHH7/YWhNFYSFEy/ch5PZ9YSfDDZuq6o0nD
 4rMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126853; x=1719731653;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h25hTtE3iszL243EN3L/BanznYfr4S4AGkpe+1b60ns=;
 b=C8SiPIWrZDOoNBfCPfChERaWyg406JvUXFGHyU6Gwn5Wo6bNQrg8xq4FBefsvhrOp7
 sNFxUuERhAjKt0Liif/CSoWxnw5pYDQZtF7/8cpXIfjYYPDk6LunbAWWK1NEaVK/tbXz
 AKVjk24L7iXAWjFZ8RtChG/cFfuJQ43vJIvFF9EwyRClGbYP3M0i0kjk2X9UaC6Zho+B
 izYzCOuPt9bSMXyvIDKJYAHs0RrnziKmPPNeaWIRwL4r6A2bGBFM/gkqB+JQtb9LIDvt
 zYP7p6bpnrwTE0V1EMxUfcZnGRedb9PYJTL74uggkxfZvgonXt4Vl6fZ2jN8Tq+4tgcx
 ygyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtjGxaH2ODo6GU5bmwL47pmalSfGOpUPcGDhD0bFR8C2n4dbB1QuKHRoAq+ltEUozByxZ+iPzliJEBwIUmLKFTzKUoX+j52FNodEFCncNO
X-Gm-Message-State: AOJu0YwoeR5iRrcRF1V7N0mvvfn5OPYrk19tJ7fylo5twMNDTy9EAoUq
 40RMrN/NWstk5tBdEaY81ChdYT/pz52W6bq1jumYDyCxwL4qcPNlzLZRAIijkVU=
X-Google-Smtp-Source: AGHT+IH6nBtadss1DB4DlOcUB0869LeXq6AxqTp72qo71M9rfYT2F1Fin42ZjsvT3zUahu4cHfWiGQ==
X-Received: by 2002:a2e:b179:0:b0:2ec:5685:f068 with SMTP id
 38308e7fff4ca-2ec5b337265mr8057591fa.17.1719126853644; 
 Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:13 -0700 (PDT)
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/8] drm/msm/dpu: handle non-default TE source pins
Date: Sun, 23 Jun 2024 10:14:05 +0300
Message-Id: <171912674294.840248.13079605621407953516.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
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


On Thu, 13 Jun 2024 20:05:03 +0300, Dmitry Baryshkov wrote:
> Command-mode DSI panels need to signal the display controlller when
> vsync happens, so that the device can start sending the next frame. Some
> devices (Google Pixel 3) use a non-default pin, so additional
> configuration is required. Add a way to specify this information in DT
> and handle it in the DSI and DPU drivers.
> 
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: display/msm/dsi: allow specifying TE source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e0bc725bdd0f
[2/8] drm/msm/dpu: convert vsync source defines to the enum
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c09b19b79d27
[3/8] drm/msm/dsi: drop unused GPIOs handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/149d195638c9
[4/8] drm/msm/dpu: pull the is_cmd_mode out of _dpu_encoder_update_vsync_source()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1ed505b60480
[5/8] drm/msm/dpu: rework vsync_source handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cd1592c3e31d
[6/8] drm/msm/dsi: parse vsync source from device tree
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4404dd757c5d
[7/8] drm/msm/dpu: support setting the TE source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ecfc21292865
[8/8] drm/msm/dpu: rename dpu_hw_setup_vsync_source functions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b8caa9e8668b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
