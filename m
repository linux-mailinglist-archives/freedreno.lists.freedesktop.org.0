Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C899F240F
	for <lists+freedreno@lfdr.de>; Sun, 15 Dec 2024 14:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEE910E21F;
	Sun, 15 Dec 2024 13:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nViVjC7Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960D10E1BD
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 13:10:47 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so3301790e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 15 Dec 2024 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734268246; x=1734873046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
 b=nViVjC7YpXmrgG4U08r/ojPxjCAr0+Zm/cd8UVhjhY9Q5sVLG53BO25yuCqJhK7cy2
 UTEwsx3XjAVBx0N42U4XaK9pOkR84KU1X7WH69xi7EMOmdKUlAkCfRnbktLVpCfzMAGG
 3g0RViYAvCwSPw6f4kLc6UKY4XVjMg6Yk9PtBZCY1GKvp26PRdX4nfrWkMuP13SyuXG+
 vV44wqNjExm0J6DyinTPB3qcgEh1KXzsCjUUUSOAVzSlcVztVuIUcZto9nfAP5k0r+Fl
 veRaMqlgIV4NYOmB2kMsSC8jcvFKC2v3CmN9N+OjX2wyIY3R040q53wnXYEwbKfSBgtI
 KODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734268246; x=1734873046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ju05ziYlwbIpCgtx0Bb9FPQKa5IBD6RMSsDPSFRI4ws=;
 b=LIVg58V+HQJ2TldHgy7s3O0RkdS8A2mh8ejEKzoVohTyFeJ3NP8QdnrKR6fWUYBN4q
 HsPbKHIn6uRDxCNi4BR+rW6SoE2ciQx739ibYV1xnZgD2rugfMVNnG5Bs/3ATSm4e6lc
 sRAd3QBkfZWLuEdn9PkpZkdSAg8x+qHTg8/LDGO94K3kCIvBH5cuXeouXtGHAj8IxM/2
 fGkt31MRu0cMbuErMn1MzlM5bRZgCaq/gdbGKDG1WN1ow8KlgXd+6cMTuwn8rvpFY1C5
 eI/zYCl2RlL3QA930mdGo8prAepleyVdpEONVCp3Et1879Iew/fkRu+iuYToxPUiKeI9
 HHRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8N1eO33Dj3l4t0lOmcJLH4xCGOyUEfHV6LfCLT0PDzYtHEmw/f1QbgGh26BQgeIdzO+EqhGQ7SB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylRCA80ggU+XSikS+W58FA/IdvgPSbFC883gT2M8okAWeUOiiK
 vSsbcipmF95gnnWCpYce6L4oQDLDGwgAQJ3xNqiKdLN16W02XAM8qmYdb5IL0Os=
X-Gm-Gg: ASbGncsyR5OLOOmjkoVimsSPjLAcqQpaJcIqg6OQe0RtLBLDzFj28pmA0eLRyQ9udV1
 1elEmtXv24GOdGvr4GMHPzo0qWDyNgSzSTkpzhy2PUC/59VD0fbkgxoUKAu8XkCPqutCU+zXMFR
 AZ8oNTTZLncCWOyrg8q3twjHY2K78ugWecd+NEzajrfohYA23yfH2E6xN2cIbt+gQkDno6lgUg0
 Xk1m9BWchW30Sy3cDP7opxXtn+bupGsr7QhEX36s8RCwW5orulwRlNq/URGeQDZFY+8Ad4S
X-Google-Smtp-Source: AGHT+IFk9r/owQGni/IpvIbzf9xRA6qONzpZz70R2mTsMxoKxfWh5BJOntsOsl8hiRXd0joBI6OGdQ==
X-Received: by 2002:a05:6512:1287:b0:540:1ca7:4fe9 with SMTP id
 2adb3069b0e04-5409054e4b0mr2641383e87.22.1734268245751; 
 Sun, 15 Dec 2024 05:10:45 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c00262sm496316e87.138.2024.12.15.05.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 05:10:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/3] drm/msm/mdss: rework UBWC registers programming
Date: Sun, 15 Dec 2024 15:10:39 +0200
Message-Id: <173426667308.2196979.1702626124443847535.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
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


On Wed, 27 Nov 2024 16:04:31 +0200, Dmitry Baryshkov wrote:
> Current way of programming of the UBWC-related registers has been
> inherited from vendor's drivers. The ubwc_static was supposed to contain
> raw data to be programmed to the hardware, but was later repurposed to
> define of the bits. As it can be seen by the commit 3e30296b374a
> ("drm/msm: fix the highest_bank_bit for sc7180") sometimes this data
> gets out of sync.
> 
> [...]

Applied, thanks!

[1/3] drm/msm/mdss: define bitfields for the UBWC_STATIC register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/43eb9a8a372b
[2/3] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2cb62d9f9cf1
[3/3] drm/msm/mdss: use boolean values for macrotile_mode
      https://gitlab.freedesktop.org/lumag/msm/-/commit/dc7b16a4f055

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
