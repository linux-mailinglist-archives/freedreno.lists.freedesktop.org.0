Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE9C85CBA1
	for <lists+freedreno@lfdr.de>; Wed, 21 Feb 2024 00:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB47C10E5AE;
	Tue, 20 Feb 2024 23:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WpjejAT/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A7F10E5A9
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 23:02:51 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso4628446276.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 15:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708470171; x=1709074971; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
 b=WpjejAT/EbuOb9qozgxRNx1bCJpD9r0lv7yD9Dv4Bwgil+/t89i2qNQLhTKjrPka2O
 2zP78Kf0joRfp+DKX2P2MeySIHf1Yt225LaJNWXjM79zscsOG14P+TNY7oSRDnH9u9WT
 ONv+jB5N42I0ZaYWk3N8/tz2M2dyBiC7zKg3QSld3QZ1/QiHK9V61xdxjO9fq/bu8kOy
 Z0cs4Ad5SRKf4ifJ9LUrRobf0AuGo6dUfzXFkTmJ50t5eJ6n8GrCP7NM0lvXuqY/ZTxc
 HryGiNBf3x1Wq4ySOjZ2+iTrmIukNKAUnNCFuXxwUE7OTTN+2wF+dISQJtGhB7hgzzmp
 zDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708470171; x=1709074971;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h3xcc/5DqDQe+adCv6bnvAUmiBqc6BygI5OchyBvkgA=;
 b=sqOjSllCLY8Y2xtA1L+ttXiOgZ32cLpy+wUHkdAfRktbCvA6qq6HEPjpBZc7q+vv3k
 OzmlIE31iuSAhCC19I5s77P61JxBjcpUGVkb33hxVCv8VKJEW0I+Cq3cPYPsM2DHLng4
 /MeVb1eP0XiRz+J9xhBnlwHiPOPSVYcAzl7Q9JQsJXSZWWTFX0M/kQcNL28lXqD6IZDp
 41GSPhfSmUh+BtauTbHDR0eng3soMXCJedz4C0tBS+LjIUG4qHwqh8w9RsoNUX7omq0I
 Env/Yft5TNGtujdZHuUPqLqHQxdR2GySY6dProCpmAgZtM5yoss5C5MiITTbNQrkI3tB
 OQcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0V2TF1z1we2+alUTCp3pizIH+BpZJ0+4gRfr1Gb4OSxqu2LOjd5ar4TkmEdejntdyrnC9wy5XGf3od5uXjyxGZBGaz1ZY0YQjelSvuTvS
X-Gm-Message-State: AOJu0YzhliZTj4fF5uKROulfd0VAAt+LBf6wKMH6K0Db43jHij7OW8ld
 wS6X65+UEPAn1tzYlVyM7AVU33m00ko2UDF2hMIhcJod6xJ63++8DPEgnKg6PIyRgNHVKhpg5U7
 VlkTUoDyl5yC7n+noKsk5IcolgWBDBhnQaZl+wQ==
X-Google-Smtp-Source: AGHT+IGOx/zC8gPSOJQuDPkSkd1nf4N2mE7xnUIZOVlkbUscpDxNFS5fOG+JiLkWkR6HldqnK+FvO6CDi/U96xWLW4E=
X-Received: by 2002:a25:ab08:0:b0:dcc:ca51:c2e1 with SMTP id
 u8-20020a25ab08000000b00dccca51c2e1mr13283832ybi.2.1708470170970; Tue, 20 Feb
 2024 15:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
 <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:02:39 +0200
Message-ID: <CAA8EJpqSw5N5=Ki9Y7n5Dr2Ytxboa4u_d+a02Wicp=QpCNyiUA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 21 Feb 2024 at 00:50, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add the X1E80100 DP descs and compatible. This platform will be using
> a single compatible for both eDP and DP mode. The actual mode will
> be set in devicetree via is-edp flag.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
