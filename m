Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F230A4749B
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EDC10EA29;
	Thu, 27 Feb 2025 04:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j/Ypr/Zg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB2710EA34
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:37:51 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso297480e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631070; x=1741235870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T6LdIc9yizVRu7YYWVAkfBn83oMhAPA8mxliRfutysA=;
 b=j/Ypr/ZgpcLYERIoS+UsngGpWhNjK4rvhXSRoWkyaw8c6hEpBxpp9du3qBNC05U3GO
 ulk7Gs0JUdAYpmgJUdE0U7LpGQSgtCBz5RLqLCLsbU5gStbX+36xd792mZosQCSvlfZJ
 EmTeVlpQ3svEWFEc66MkOvTzNZYJcRlbwSMNhmQA0AUPhm5upGt05JLlZE5fYhPfgKcw
 8NuIoSinARLZnLx+BJwPbHIQdysbid/WcOdsYOMrya/ngWmJpT2S+CTawUoQztLPIG63
 2TSCjc2gpU7xKDQleDLN6izlQP6aIplH9Yf0A29vJ48F9a2c3EPX8/ZQsGLzFN0//n2q
 ifVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631070; x=1741235870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T6LdIc9yizVRu7YYWVAkfBn83oMhAPA8mxliRfutysA=;
 b=kQNhlMT7RZszk0ekMxJ2fU7XxyIyO2cHVoODh57kW3n59N+YXmq67w2uTW40HAiPwY
 oEBYy9cPoqe/KhfPVP2rekVs+YRCSv6IE8id5qnDVMFCSt/tsbIZgGnSC74/G1J20L/1
 AuByzzZo6w31MJv602mpMSpUH6ndV18Damr1t4GJ/7RMzAhkYSx3NLlHGGlMax6ZIi/4
 FlKMGv1zcuFxAqXszAhQFbYpmK0FQyRuPNH1D4wBINMSMsesJ9dmAxhHrh5OKj+aFLAN
 KRPHNb+l8Iv2E35Mgbx0SHzdBiBk/xiDnMsJvAFGIsIXnumyVAwIWzPWzNKt8en9LpdS
 FDqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW03/fXMJnTbqrwJz2fZMgK7s4Ev8B1WYlE4uxO7ezUe3e4Qey6RA30VBEqoEEWcVlgHqZe2/IIQus=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjpzFFaP1hIs82g7437bXazZpp1tAaU3YeK4sGICq52+/a54TV
 4W7iWX0cgl0Wzo87JpqEEcNq1ov6vt7aGK8+fkJDy1T5iuXtqytk9eECBg65GBw=
X-Gm-Gg: ASbGncvt+6SAcBhGa/oQHN06zMw2g9hyDHn/1gP+/RSLxXMTI96LAuTpG51R/QUqKTm
 JEMjpL6TlxCbXyfGSdgHId4qROHWJYLbI4PWXpPVHuZWo1Cq6zwnSqex+aTjnSuAoehZ6SusCf8
 3UynG6RyLk0dzZZTPqfcZgeHL036g/FJfHGwoTgJ3ST6tDS/y1fjJDStwhNXdi3y0pFHVxw1lkq
 Bel4v0ant8EM0efnCfFzcrcC9+PqM+DiMbq98+NMcYcSNKQY7txxjGIH4HrV1eVYB87KcXOgc/q
 iqLZbjoRn29wXTq3Oy+wEInMDktNiwR61e7DEDT1dQ==
X-Google-Smtp-Source: AGHT+IFVfY7P3tdpU/L92xnHX/l/Kg0ZrZYS+uJyaV20SbfgsFQttCuFyDGhgqjNFTbnxyxtm9a5Og==
X-Received: by 2002:a05:6512:1389:b0:549:38eb:d68b with SMTP id
 2adb3069b0e04-5493c5adc66mr4548301e87.33.1740631070243; 
 Wed, 26 Feb 2025 20:37:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:37:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] drm/msm: Use str_enable_disable-like helpers
Date: Thu, 27 Feb 2025 06:37:27 +0200
Message-Id: <174063096235.3733075.4349530732188818370.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
References: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
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


On Tue, 14 Jan 2025 20:17:24 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Use str_enable_disable-like helpers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/25dc6948a06f

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
