Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 632729FC250
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 21:42:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84110E4A6;
	Tue, 24 Dec 2024 20:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gKuAznRO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2DE10E4A6
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 20:42:11 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3003c0c43c0so60440741fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 12:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735072870; x=1735677670; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJtLBAKNWX9SuSyfWJPwd50DWzglHV0KUPjPlwl/9FA=;
 b=gKuAznROyMJ+eZcr9Y3YiRy7eBb3ZhULKeTtS9VPmX8r6n6yazDgCy7J8rGymHu3o8
 5FGNc30WT/A8M9BQI11iqkGBK7ZO869Igisyi4BVxgOSBi4eRyuszfrJU7OgeRVWr0p6
 oGMznd+j2urysgQRq7qjc2MaciG2YfCfaMjCuIdD7Bx8uicIHp0t7bRX4iIkBjclQYja
 TT8uPJgJ5Mr6NL+BqpjgICYkBRadBCWhy7c9ecoVteb//asBpWzEB7STZL+PdDhBcN+J
 KjecFLoBXUpHfV4sVLHJHgnAyA3BrgfNG3dogH5kB2UE9qygt+cUpN1BrUw47Gwo4f+F
 1NZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735072870; x=1735677670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DJtLBAKNWX9SuSyfWJPwd50DWzglHV0KUPjPlwl/9FA=;
 b=ahrMCwpCoCs/mfVY84W68QQver+u0xUC7+GBSA3hei4RmTbx4TkyaUbUEP1gBLc8hZ
 +qGLuyc7yc592HXAZtLqXQ2jrdDyCUqJJyk04bNqSFbyIv7AAfQPEf3/Ae6ZPSaTg/DR
 VWtUkshJBIH2o3kaHb1N8rRkYdSTc9o0paTErmdKMoD8mX2eNKzCEBFDErc/51QX5ggF
 Q7ZYP/BqIrxsWRG1u7xl1Eoc7qKbByIX6My+Tqxwkt8TVuzly7gV5CEx9Dpz1H9bwH2r
 0YBcRdWEkaKRVBA80XH+y0xyHViiEhaZjkYFFW7BwTyVl2zt/5MxKAbkzvJEq5x/a5ZT
 +3NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTM0+0uKHw2V/g99Si1qLZcYm8RJLmIENASbLbBVVbYF1/MUPcWAjmgHUfUqNowZbT8eqzdrCbwy4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZJhIsxCWZVSbcad+Wlh1TMPAsxgGUFgznMmtfUQcAj241dTJF
 xM2uYa07xyoj1M1qo+Am1Bn3u/V2iYuW/1LHvh6H6dn6w6q0Z/mw+POWAOhSeBs=
X-Gm-Gg: ASbGncv+qp6DAhzAFI+UezU+YKcZ3DMTLv+e+c1Sg0GBK7P9/AD7OKJ0XyOLI/bRE7o
 O3KNqaceunO7u3q5AjtE9x7a00g1RQODxh4kLH7K1EyAjAMtR8O/TkHlAa3Taix/3SPc0OWSYat
 MQihFHn6J1BCmRxqX8BI0ZkQ9PXwZux5Vn6AbzTKHaLCMEzZEaaDK/BUZ2sDp4BfAjQmMtbgm2d
 AxPEo3goNFHUTQrzqHRdM+pgWEWPiK/zeOg0geuUdSy4qtU1d87bGlecmhy+EwCIv8ac3Cv
X-Google-Smtp-Source: AGHT+IFF5gVpfBOUmUazl9+O+Qp/eY4DDpdgeppZBxS/LFNrvXVCbTXqTTHO3C+XtwgPrSWhH9XBIQ==
X-Received: by 2002:a2e:b893:0:b0:302:336a:8ada with SMTP id
 38308e7fff4ca-30468607f65mr55970431fa.27.1735072869982; 
 Tue, 24 Dec 2024 12:41:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad9bbdesm17808361fa.44.2024.12.24.12.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2024 12:41:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/msm/mdp4: fix probe deferral issues
Date: Tue, 24 Dec 2024 22:40:59 +0200
Message-Id: <173507275848.561903.12093741891942596753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
References: <20240420-mdp4-fixes-v1-0-96a70f64fa85@linaro.org>
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


On Sat, 20 Apr 2024 05:33:00 +0300, Dmitry Baryshkov wrote:
> While testing MDP4 LVDS support I noticed several issues (two are
> related to probe deferral case and last one is a c&p error in LCDC
> part). Fix those issues.
> 
> 

Applied, thanks!

[1/3] drm/msm: don't clean up priv->kms prematurely
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ebc0deda3c29
[3/3] drm/msm/mdp4: correct LCDC regulator name
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8aa337cbe7a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
