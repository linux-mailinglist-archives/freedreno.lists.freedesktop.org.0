Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0624C9F2411
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 14:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9944310E381;
	Sun, 15 Dec 2024 13:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tWxFFh8C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2432810E381
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540201cfedbso3277466e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268247; x=1734873047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
 b=tWxFFh8Cu2Wd9dRdZfyu8TX+VRg/yXXn1IOoG4HEIRN1iLDvPfWg9qUQVbTr8KVwW3
 Ln+S6j/InEm5jUirtdkpyPEqsAvgcVg66xPtLJVJFvXmwsfSx2odGGKwft3S7/opWfHR
 RBhjN+dzaujtx/cRe0moOAZ7OpnZc2MMDh9NGFjDHJxCfauXTvn70TRhV4/gw1Y6v7Y6
 +00g4TUOTV3YEU3uUHaPP04IcB3uLl88dElAD1Pms9kiQP7lVjKT//mGsiH9879lDHA5
 VnVekLLXxVgcShWLvDuLTc8NvMhqedFlKGYFCbHjSwWKF/UCUeyrqxmUIvk9+lxJMpp9
 zYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268247; x=1734873047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p8Lufl0ILgKZ9FP7Gdlued8m2MWHGsVjFWpSoKBOb0E=;
 b=NRLKgCw6pjro6pDsrw/PtLPnE4618GPqfUxF3J2J/WvAbO7kYYKm6ob/MqzEdOGwDM
 snUK92xsoEdhhZ2VYHtsOeh/ChxZgjBCPVsZvrZUipG7RPONRF3bSUTyTL5AQ1E3j5O8
 pOEHPxPtWEOBPIrSMFC4ckZQX95tQJdan44aX3Rerjm6FgGTTWoycn0IEXadr32bpyP5
 s1OtvnxGHfvg5cdvd8kcjchz1Jy6CsK3NjifEltB92xbexMXr61Wu3S9LE5FeWYCj3sa
 xVS4J0l6pFPR6WgOmA+F4zxrCKpKP7eUZ3sKdoZJChFQAfTNw5vqeGruyL6zz/o7u3ZG
 0qBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHlSrl4tfyIgaaB405ltvcv7BOKydebgzijUOpQrUg9ITPnnTmoyMtfCsZEq+aNHkcDLkIXrFrsLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyStOFIyaBooyW/nuW2qygyhZPRQp8+5lFc6JuPLAduze6rIstM
 UNOpww8gMckKTg3AAUd5Aqbs0FSq1049QYrrsSXYjmu8m8uQuR5AuQbt23/0nUg=
X-Gm-Gg: ASbGnctFbxTT/o/02Os2t8PPLwUqiDP8c2itpcEzoKE0xmZT+wb9ebpLVdmYRIlZQ+O
 8b3NLkofL1hY23U6GkO0eNWMftzV339zBCivoNhtgii8y24nmJ3opFjbYUCQ2XsZvcXZaall7z+
 ivQs2KTgBfyj3FCuGS7rItrWIVAYhMsmgY34OBbrBghNS0UXES50E0zK+PiuLRrJWkKwcHWdcva
 pqCLYDgH8ASIY7W8+aTuMLF//wxPVO9+S1LcF4FN7f1Wgs3RAH+t7bRr8PRfOM+XmvqpTMr
X-Google-Smtp-Source: AGHT+IGqHIES4nMAi89BEi/1nE8BdUE7Xhkvgu1X5vkOxL6g5oVRbKfjkZ5/mlLOzrD9vjkEYsggXw==
X-Received: by 2002:a05:6512:e98:b0:540:2122:fae9 with SMTP id
 2adb3069b0e04-540915e2c9emr3090946e87.46.1734268247484; 
 Sun, 15 Dec 2024 05:10:47 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/3] drm/msm/dpu: support virtual wide planes
Date: Sun, 15 Dec 2024 15:10:40 +0200
Message-Id: <173426667305.2196979.4925128538148948458.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
References: <20241215-dpu-virtual-wide-v8-0-65221f213ce1@linaro.org>
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


On Sun, 15 Dec 2024 14:40:15 +0200, Dmitry Baryshkov wrote:
> As promised in the basic wide planes support ([1]) here comes a series
> supporting 2*max_linewidth for all the planes.
> 
> Note: Unlike v1 and v2 this series finally includes support for
> additional planes - having more planes than the number of SSPP blocks.
> 
> Note: this iteration features handling of rotation and reflection of the
> wide plane. However rot90 is still not tested: it is enabled on sc7280
> and it only supports UBWC (tiled) framebuffers, it was quite low on my
> priority list.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: add support for virtual planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/774bcfb73176
[2/3] drm/msm/dpu: allow using two SSPP blocks for a single plane
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8c62a31607f6
[3/3] drm/msm/dpu: include SSPP allocation state into the dumped state
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d82c9281189d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
