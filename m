Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74458106B3
	for <lists+freedreno@lfdr.de>; Wed, 13 Dec 2023 01:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC3710E229;
	Wed, 13 Dec 2023 00:37:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F014B10E14A
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:38 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so7429187e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427857; x=1703032657; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSCgKJVh7Aq6raN1kOP54ZRfx8NzvoUiUSv9wHSRjAY=;
 b=T2u0FL2wSEWrGag4Im/hsrz4Vwq1vOXYPXf3eQksqKVDPjrZd399WAp+QcmzROSAKP
 n3o7z0W6ybBW6MVeJOeYZX42YFu4qcXuk8k4Y4zzXUBTT3OVIuDQqoK2zZHNjtvUK+nV
 5GyDzviwCaoB0CZXAh08APwXqH9Nb2b8Z5mWKTzsFqAep6MWOqdeuT6SQiIM7SYYGKjO
 05LuIQJ5+oHaUoRuGEv2rw7Tvj/QLdFRnD7kS8S0h35jLGcIbOdFieLbqPGu2UgZG7af
 /x2rND7mTe6aLh8ou4mmoEs76ifepKwPECeAqChoalVtlE6PCl4cDAHMguypw3K4xnNo
 iwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427857; x=1703032657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSCgKJVh7Aq6raN1kOP54ZRfx8NzvoUiUSv9wHSRjAY=;
 b=ptoKRqMjTLeYeAzh5NTK0RY6JIbbtJaHal2kzSyiWBvdC3CL5s5k3SpW95GRH0z4iA
 Ax6ow17BpfB7518mZMrDx3Fm8aCAYjgXQEevMkSk9wGyeAyLtSuepHzkrk2dTbonSULp
 C8bKLpNI6IFr02LZvqTxTD5ulf7O/DRiSEuFv0rGn4fuKKR3frZCwKlRZ7Ns9YI9jtd9
 bGw/p3zCEYc54gSUw3cxcifwosIZ/ounkKwT6+4A7FzmsWjDOSMk/+efXgsIEqhRjgtI
 b9kM3b0aY7B1p3tFhwIYh4WJ+tqDZv/E5dWqTOSzU7QIAoiiUtWKzySkA5wIqEThegT7
 eeHA==
X-Gm-Message-State: AOJu0YxcxiifqHqxXkjpW2iXkVLcn2fQMM+6sv1b4tClh3xcEGmWEdzt
 ApYSzaj+Oh/4alidXXrAhelE/w==
X-Google-Smtp-Source: AGHT+IF73nfm56nkB2mm650VJtqU71JG3ISCUoo3YLH1Caud8GmPxaBSrn51FVw0yj8hkxHfHPfmhA==
X-Received: by 2002:ac2:499d:0:b0:50b:d990:39b5 with SMTP id
 f29-20020ac2499d000000b0050bd99039b5mr3112617lfl.11.1702427857210; 
 Tue, 12 Dec 2023 16:37:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs directory
Date: Wed, 13 Dec 2023 02:37:30 +0200
Message-Id: <170242755507.12964.9347100992434762477.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 03 Dec 2023 14:53:12 +0300, Dmitry Baryshkov wrote:
> Resending, patch 1 needs review from DRM core maintainers, but it got no
> attention since October.
> 
> Each of connectors and CRTCs used by the DRM device provides debugfs
> directory, which is used by several standard debugfs files and can
> further be extended by the driver. Add such generic debugfs directories
> for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
> file (which contains per-encoder data) and MSM custom encoder status to
> this new debugfs directory.
> 
> [...]

Applied, thanks!

[3/3] drm/msm/dpu: move encoder status to standard encoder debugfs dir
      https://gitlab.freedesktop.org/lumag/msm/-/commit/62d35629da80

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
