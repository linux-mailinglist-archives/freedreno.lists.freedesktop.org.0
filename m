Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB285A34C
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F2410E3BE;
	Mon, 19 Feb 2024 12:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NwmtTCTe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DF510E3B5
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:54 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512b13bf764so1126148e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345852; x=1708950652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hlwtv8HHmQzS575dzwLezHfUxs6dYPZU5AK2+ElAWo=;
 b=NwmtTCTeq2FjLARnwYdx46ZYxYf4tWPfKocEGTnNKW3FVIdDmdePzDlnDJkd9Zj4V2
 zjbWnqQ/xjDL6yB5y/KhTKe9nmRIFr0/Lb/eaP11uJD+QRFFFytxrCx4cxXNJrMaSthx
 zcP++iy571W/nN1Z7i/mWIzkfUhVfl6BPXZAXlGh5XuXa8k2Y98hSb6U4ZCrQTEJtbqE
 1jZe+aKHV8XtcJzYWVcGa/xlrQ9GRg7++kzA7N+1sXs1gUZRe5yNbJRM9OWwvzKc6NCD
 3VOVkfrF1e3lNwYlBlIZgsHGhXby+swBil7m7q2pjSECsNARZfvqFEP/rjyFhsr4kD/6
 y9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345852; x=1708950652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3hlwtv8HHmQzS575dzwLezHfUxs6dYPZU5AK2+ElAWo=;
 b=UywvpwV74agBtUk62V1VfWrEdLA/I5xEBt4JZsWkXa1J2kzPlCi+Pr8tgS48JM6Wdi
 /G4i8QsQamn8yf5y48ts4y7i7Zk52epq48UvUu4JLr7T5tisxECXFRlI2zXvHETV+NKX
 wNRxMfaMeiy6DPQe1+LELofmsZAYHmIXWHgmN9bqcbfbnDsdxoBOdV22v2z9iV1uO3Nn
 sUX6snEFfA+VYUSt189zDuIDuppEuTHZHUZ8hYVxVScCalaELJ6RI7oqd9HhjAW/dkPY
 ir7q0V/BZWJ7kHAu+SGxdUo5S+N5yzn7RxMXiUZaAbDJES6uamkzLwichxv8Cr3aUdBP
 7ndQ==
X-Gm-Message-State: AOJu0YzXfbWcCuk4xK3tFQqzeL4v73ik8blfv9M09FIBqSJ9GPLlPgtX
 hKugHzOvjBXT+GAcp7gRWybCnqvJvGTzWK0/fqrxcS/sgx8tH0NaacPSvFAp4nLDbIRiCeMiIFh
 c
X-Google-Smtp-Source: AGHT+IE0jfz4yHK3if/jDmCGu5CgI0XKOOQubHh6KWwBe8w3ElmHhuCgl7ia1FSM7je4L7aFLoWbQg==
X-Received: by 2002:ac2:5f70:0:b0:512:aa1f:669 with SMTP id
 c16-20020ac25f70000000b00512aa1f0669mr3244373lfc.16.1708345852317; 
 Mon, 19 Feb 2024 04:30:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_parellan@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
Date: Mon, 19 Feb 2024 14:30:40 +0200
Message-Id: <170834569504.2610898.9861209755234701937.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
References: <20240201004737.2478-1-quic_abhinavk@quicinc.com>
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


On Wed, 31 Jan 2024 16:47:36 -0800, Abhinav Kumar wrote:
> Currently INTF_CFG2_DATA_HCTL_EN is coupled with the enablement
> of widebus but this is incorrect because we should be enabling
> this bit independent of widebus except for cases where compression
> is enabled in one pixel per clock mode.
> 
> Fix this by making the condition checks more explicit and enabling
> INTF_CFG2_DATA_HCTL_EN for all other cases when supported by DPU.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: fix the programming of INTF_CFG2_DATA_HCTL_EN
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f4a67a3894e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
