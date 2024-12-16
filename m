Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205649F38F1
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 19:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C194D10E75A;
	Mon, 16 Dec 2024 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="UW8NUrUU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1E710E75A
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:03 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so36447947b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373742; x=1734978542;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
 b=UW8NUrUUe9654SEVe7pI1c+Lgs2TMoTdolmBW3KaAKrfvcGLDCLTYhHCnyueCw4MPZ
 77FdCuOkz5qjXZwl4YkmI5qYvUfbMK1q7vBq3cqd5HzMvazTFdqg61jqa0LCsPXx/6gU
 YQdrQXnlVabKmgjv46sTJfVoIbgpRpXaL3r8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373742; x=1734978542;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TIlSRQ7ahuGDkgFihn78l4akEjGDGdpYykjVXL65kQ=;
 b=ZPzjF7lqxqpZ5Xzbn8vB/zaiXDh/Vbq+JnA+AfrhAl1JjWdu8hBL0dJU58Cpw/ADVh
 pZEytDTjGu1bASer6OEbXZ12vWpSBYR/sC8uSU/1ATOsQdCSAmMVjqrO67jo35xFqyLM
 nM31E+MAsgrkQBNr1OHbi6EqJd5aDnb01Nwmf9eEHh44J9tEdZvnrjS2Epd56a7TEQIu
 7hHSL+WV7jbWZqFZJ1OD6Ls1gMt1h2X0MMQhsCIXFfQzyTYWQvkKkwrlnRKyo0oFnT1s
 gGNwkjKYb3QYATOuRQKk4VNWj2b8KoYgkyr6lz4BcnrTM1lk258KDzU8Hjet8M5SzA/O
 bnWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLrv1eURLaXtBVhQEZgnhw+K8GNZXBzEkv58GQCfa7W9dHTkUo78DrjbDAZtZK90SOCg4AwUnWN7g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqo4MusacDRuSI6zCR9th15XrkPpHKXGKQ2nf0Mb9oYfADrpWC
 kAImzD/iBuJlR2A/hIhXrd0xmVEA+/Ab4XBY04o0SRKIm2Q+95ZJd7oz+a2t1r14U3+XJRuAlz2
 nCCU3w1pUiDVRjhanfulW8gHvExVce8JmhHiF
X-Gm-Gg: ASbGnctb3CMv/xxYtZKoP4fW1N74WvbQRAxzJEAmjFIbik447K0Iq7igL42wXfLLYAs
 UEzrnUOmwGbd/xkzKz9I+xpHRu98h6Siuu2A1XGmnNCC4NYhU2axsmZ8UgMrQ+4/TKQ==
X-Google-Smtp-Source: AGHT+IFQ80scUMo8d9IxWp5aJ4xwNtnqqvy6ffJBkw26JRJsHSxXxD+1I6D1JK6A0t7aCTHue6+bvR9ehNx3WdpmehA=
X-Received: by 2002:a05:690c:b15:b0:6ee:5cf9:f898 with SMTP id
 00721157ae682-6f279b75052mr120990327b3.33.1734373742393; Mon, 16 Dec 2024
 10:29:02 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 12:29:01 -0600
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-5-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 12:29:01 -0600
Message-ID: <CAE-0n52S3k01eueL_GZ4Dk359x879EDiOJ7zHK_BduM3bkJVOQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] drm/msm/dp: stop passing panel to
 msm_dp_audio_get()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:10)
> The dp_audio module doesn't make any use of the passed DP panel
> instance. Drop the argument.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
