Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE8E91388B
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A9610E102;
	Sun, 23 Jun 2024 07:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mV6zIIu7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F1910E10D
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 07:14:19 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ebe40673d8so36968711fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719126857; x=1719731657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
 b=mV6zIIu7cvzfc3fOXk60KQOqnai3MtXPfDVK4w4/FC8B7zzzvH49M0pzU20cbzsBPy
 cvq7CXtlfCSYaEWAZIAiy2KsVYDhDhR7A5ta7OcA3tabsOsM6HA+2gSI8YdOu3KWUwrV
 W1b9XeW2DJIKO6RAQeMgoh89+dX72zUhE4jmmJnCjFDmjzvrDdrBaDqg/Kkw5QnMrTQP
 BBu/BCiscaITeF5ypWHMRFnwYA4Y2m9DawjIiNM4YSRS0oHTvYXpNDOcQXJNvexV0L+x
 IPLwtzeEgq4GHg7L0MinNq4tsPOQCJ1mFHK/+70KRtr/xiusrNZOiUqS94G7m2LCLS/9
 L5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719126857; x=1719731657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ioH4meZfE3J0aKheUaFtsWw5CxwMG+4ACECKaInyeus=;
 b=WImvZg62/CrXqJicfKQ8AzCWA5TE1GepdmU7DUVFULAgWAXbylgK+P0+32yTW2xkH3
 XeysDbm81911wJTcPwTl4jIaZY7T14obsLLEuDv8Oqu/S7gXkXf79IUD2joYrcxx//2u
 hvIMvmE7Z5eZdtOsHRcXqFaKwzFb+ylAuNM4/ZpELRpgLzSe/+Y9Jy1ICi1eXFOg9vmN
 rFiWEOY0d974gQFZpV19wGSbfPYEQ8n9qCgEkYvs/ZsQ/O3Dqz1vsjFophLIZdqcISO4
 ZwPLl0QUbqdErvvEKHj5LUhGDIWSjnj95DwXFD6BBYlaPTSAT7MAvYFYhDAFn385ftjL
 L2vg==
X-Gm-Message-State: AOJu0YzmHCwIymltqeDDYFF0FoshL9H2O/8L+h+JdhIXEFNZcglyjOkt
 jK28QfjM0gnWmJPpHsfLTn/j2HiRpHAJq/wMUKjlDYXXq8MFroP4zWRqOo8afm50CIJAAURVvmI
 9aWA=
X-Google-Smtp-Source: AGHT+IGMCFummccQ65js7i8Tyhq7c7d4P8AFkM0I/x+JPP2dWKhThzCfyL7cKG7s1TsbWGSSuOl3uA==
X-Received: by 2002:a2e:9c90:0:b0:2ec:5518:9541 with SMTP id
 38308e7fff4ca-2ec5b318018mr8720431fa.4.1719126857567; 
 Sun, 23 Jun 2024 00:14:17 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec5b031208sm1886861fa.26.2024.06.23.00.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 00:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
 dan.carpenter@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dpu: drop validity checks for
 clear_pending_flush() ctl op
Date: Sun, 23 Jun 2024 10:14:10 +0300
Message-Id: <171912674296.840248.10530875454580478310.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
References: <20240620201731.3694593-1-quic_abhinavk@quicinc.com>
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


On Thu, 20 Jun 2024 13:17:30 -0700, Abhinav Kumar wrote:
> clear_pending_flush() ctl op is always assigned irrespective of the DPU
> hardware revision. Hence there is no needed to check whether the op has
> been assigned before calling it.
> 
> Drop the checks across the driver for clear_pending_flush() and also
> update its documentation that it is always expected to be assigned.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d68e3dedd4b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
