Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D105B8022D2
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4136B10E27E;
	Sun,  3 Dec 2023 11:26:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944F10E273
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:38 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50bf2dfda6fso298863e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602796; x=1702207596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
 b=FWFCipBdangEXHRrHIJc1r0JvVNlacgJVd9x3mFQyGiroc/KGD4M0L1pWXB/Zsui9a
 YqAjKdTtvavVHtlWXqdeQoLorSwePzUzQN87UBMAv3j5OnJpDPhOr8ZHQzhrCz2r1T04
 q7pCWTfAH9mJQYVN1oIVAcSdTvdjMl+Yia6ICbEHxAFSoWN2igJfwQLIVW1vkxPj9eF5
 tnDqbnEmm/eQ9GT+r8LoB/feTuJKvrp6gaG6JtjhNXYBbRVqLhuiZnt7NYv9Oz/v8YtZ
 QixTYmP+6EMpLCl9KaNtLaovZAot7DmlkAzHjoAt+E+dg8icUzIDsCc7xF/Q5fCIm+3D
 OmjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602796; x=1702207596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8DMMWg+w+KEomm3KE0TeojNDTcW3lAFkE8ZnpXQwhC4=;
 b=ZYHABBOoEZEn1zhAkEPqGDKncdgYmA8YWf/hW2f6L9/rV5K2lh4Y1j29nIXMmNM5fw
 h/PsQIxLCzixjw3mfrIWdDQDQh5Z4t9kJH3PFgc4r5BwWbR+ifdC1f65Gze/woE+zpEM
 45zN9cJBgb5gd8Ft8tX2PqGevUNRDJCNu8EI/zfRUWKM3/NwqRcyP+c36HumlnfgviBk
 G2/jovsSqc958zB19SBF1Up1kZgm7cCT++8t5YFhP2LiWQ/OLYhSu6bKZwCX1qcJiJ7r
 sBlZuACfgcf4MmGhnbY3AFRfXobW9+85jQUzFqds+hc4YDH7wzBeW3epS2Tjz6qmwnGZ
 d9Aw==
X-Gm-Message-State: AOJu0YxFzMHZpsQDLqUYyw1VhPV1DLMRRT+88/9NJmoskPnENHF/hxTq
 EGa6ijPeM0+lxGuzfc6uqyCpow==
X-Google-Smtp-Source: AGHT+IF9BgD9XAhn6Sf/Bs3wVNK+EAUvhkniSPZagdodJi3HF44YJ5v9sT3g28Y7D+kVvux+urdbGg==
X-Received: by 2002:a05:6512:1095:b0:50b:d764:64a3 with SMTP id
 j21-20020a056512109500b0050bd76464a3mr2893065lfg.88.1701602796774; 
 Sun, 03 Dec 2023 03:26:36 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun,  3 Dec 2023 14:26:21 +0300
Message-Id: <170160265544.1305159.14337780550682006214.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
References: <20231127215401.4064128-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp4: flush vblank event on disable
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 28 Nov 2023 00:54:01 +0300, Dmitry Baryshkov wrote:
> Flush queued events when disabling the crtc. This avoids timeouts when
> we come back and wait for dependencies (like the previous frame's
> flip_done).
> 
> 

Applied, thanks!

[1/1] drm/msm/mdp4: flush vblank event on disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6721b3c6423

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
