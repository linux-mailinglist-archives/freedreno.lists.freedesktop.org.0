Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7A9F38F7
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 19:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A908F10E763;
	Mon, 16 Dec 2024 18:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NyTPjwct";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7B2E10E763
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:59 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-6f26c517979so32694637b3.2
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373799; x=1734978599;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
 b=NyTPjwctg2bVPU3duv1TUAItq+6cA8vHdt5q251qqLoaYy32yeHqhHtCx05RUcCMLI
 o1OmY5FyIHSo2q/6sGe3RH/evgBraS9KhaO/TBpcKkTk/Ztibi3fvvPQFQDtzdwKNxae
 Te75AFepDdYJUJlfModhkziD0T60LCzsyrTQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373799; x=1734978599;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6BkjH67J+jGm+KB+qtNt47cbbPwybjknONYRIcntzc=;
 b=nYSpsG2oGLEFaoVfBozZxBhA8Bb4/6OfvBssN4jxiSMzAKY2uVPE3TyTvCE6XiOUFe
 cW34qDDXejM/7cv0SiXdr82X67GvWl+mepwuCFU8y6B8so53M+2pKQMJTKLay9U8WQ4n
 y6TIngFqJzUeUWP4UA2fJ7w8Zxcvv5a63Fohv3kz0DfYKq32vrvr2LUi6LeixemQGuC2
 Dd8XDf/Fif04jkxvioDlgq1gh9YI1Z6fIUANPawaECIMJS5esmXm3TsF5/gprG8oysKU
 k0z2N+dHZQc1CvZqrJi+p8LS7PkP7ZeVYEKsxNZJpEMu1yHVJ2uL+RUsJQGl4WhxhSPJ
 eVfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy8C5fC4E7ZMKp0nQe/ZE3aKGKAY1F0owDMd7c0HLGJY7QYxcJJlJWjTLOBKmnsXWBJ0m9Idjuo70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR1maE0MVJQjSHcKZVK31syMOsJwovbj11SJeRglpvF/GyE7x2
 1ehIXwabBSJhS4oXI/VaQ3tKijNHlx6RP9bbQ9zQ6jOBZdjK7J+UhxVp1tyl/LjBlP5IE90ixX/
 X3nPR40Mb69nnyq9bq0jUD7sCChWJBhRFL2UR
X-Gm-Gg: ASbGnctD/iobpFWIYI0TVVfoIAxu9rJmNfJEyydsK1Vm65kfnJdpSZQz/clLm/tLdMQ
 VlEFJ7k8ESnh9doeSumQkJwGMR3+lyVbw/u8YynDpqStpxYsuPuNmIcUyCe0k/bpA8g==
X-Google-Smtp-Source: AGHT+IFec3otTchyFxbDJfKFBz47WzGfI8yjCwnobgW8mFZyVIcbwLvFYT+D1W5djrG5rBzv+7Jo60SR7JxAagJAj/U=
X-Received: by 2002:a05:690c:6005:b0:6ef:4ed2:7dec with SMTP id
 00721157ae682-6f279adac53mr117919057b3.8.1734373799003; Mon, 16 Dec 2024
 10:29:59 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:58 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-15-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:58 -0800
Message-ID: <CAE-0n52Uj6h=X2PqZcPBnPDR_vVfi4_Y_miG-dTPP6FzH8rtag@mail.gmail.com>
Subject: Re: [PATCH v4 15/16] drm/msm/dp: read hw revision only once
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:20)
> There is little point in rereading DP controller revision over and over
> again. Read it once, after the first software reset and propagate it to
> the dp_panel module.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
