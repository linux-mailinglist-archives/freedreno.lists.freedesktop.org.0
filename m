Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B504BDCEC0
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 09:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7FF10E276;
	Wed, 15 Oct 2025 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eqJS4NwW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6165C10E299
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 07:22:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e5980471eso33580575e9.2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760512953; x=1761117753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
 b=eqJS4NwWWBhoBMVego1Vbv4bLwPuSLYYDeYA/BfYCDoyTY0Fh+83Da2kHYoYnKXvTk
 RSMbg4XS7Ki78QVQ1S23KvNuXqHI5FJYmuSi521PG3K+a/ZoPLPTxJfESv/M7xdjjhY5
 2bXLqH+g9UgZxdIeZHDOjn2yR/qmGbYvSOTleNNk9cHbq1CDw9nrTaufEZEwMuoR4bv9
 YW0Im96Q+H8uWBCFhkWiz3igdPrwQSP0W11p0YQf/fgJnaDHANx7XZzHsNE0r72THdYQ
 dYc1zRc82KPeEWQGZslRi9c2eZwE2DvBAsmNvHrw382CKmCHkYop3sjwGnYJ8THteiou
 SMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760512953; x=1761117753;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
 b=PncZEVT2aWFw7syhf48DiC7S/CKCkg3ddCoh1fRnkok3kV8v31G3HfacIC6j/kt/l4
 4N4LiTBX/UkWfBME6yNcGrjQ5cf24M+kQyAWvzmQ5KUkjNS9N98SULNkFNls0LmH3Qfc
 FZXfrUYbeY2N5io64rXZNIDmj/gIlXd181bITcPkbWkGkUTvfaJRcBAbysBp93c7+ftg
 n9LnISrn/DHWSDpjpDrAGMv2bdWX6kl4lqsp1yfp7yw/oaFKP4kyyLM4MrZCCApJgiZx
 wyvpVu12MjjI5+tgwKibossPnYOmubcJbBH0EYhSIpG5s3sPr/bJS9F3lxqLWUBdFk/Z
 XPNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU56pTCIbXPUBtBqpEcClH7TWpWs1tceSWkE0kKJcu747UccThmMPgT0yHt/IsZDXkMcJKQr9miVik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgyxokbOGlUfhFaE1797dez/vA72ql1e1iMIuD/nqmK0XGl3TZ
 FVkESwqr3NXJjGaE+rE7sjiySgdMyl65mwqXuZ7g8Z2Ph5mc74M+ovI++R3ZOdi6AY0=
X-Gm-Gg: ASbGncshoMeTT/CuToX6IW9RaCYN+9QJVen9tBaDzUXsR0dWjRzAQwfF6NppXA+xCp9
 A4T2iDqLGgIta51i8l4KVr/esTsOHuvaflZYbiBf8oEYHAZS4t6yCbe7mJhi9X/GlbrIh90icC3
 LX6BMW1rVMp5X4hgou0u4RvLUTievFCjyHzA9uj19l/A99KEmXdvjvXRevRK8zTGxF5AWv4fH1v
 fKrxoci+VgZGId9xhFf4pQIxv1ADJIIpsXbaGNlttp0MFwTHmWDECOuoMbTjdGD9GHtafexeAru
 08Stk7nF5/6lHSD2M6o89kowSkzdFPLPGfnRGQADGN2YvuWaLEexpr+PsxzQ5LHa63ljrBiSA+e
 U/3M4fBl9/k35c+nTsXSYPX2hJFvZdVNpUQTckX50nr+VWtvJxMqck4f/zFcbWaAZfg==
X-Google-Smtp-Source: AGHT+IH3BD5WhA7FG6Zp4c0PVdvEcLCxk34zjohYVpVCAm31anzYKVfvwlaIYZ0XuSu0KRWu7NkXdw==
X-Received: by 2002:a05:6000:2dc9:b0:425:7e38:a09e with SMTP id
 ffacd0b85a97d-42666ac2d01mr15689229f8f.2.1760512953270; 
 Wed, 15 Oct 2025 00:22:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm27804930f8f.2.2025.10.15.00.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 00:22:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-Id: <176051295262.2274368.18317625493336873860.b4-ty@linaro.org>
Date: Wed, 15 Oct 2025 09:22:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

Hi,

On Thu, 02 Oct 2025 16:57:35 -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: Update Jessica Zhang's email address
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b076ed3017529ec528f2f28b8f37242a6a29a4b0

-- 
Neil

