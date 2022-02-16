Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628D14B7D1A
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F131010E609;
	Wed, 16 Feb 2022 02:18:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BBC10E60B
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:18:25 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 u47-20020a4a9732000000b00316d0257de0so892189ooi.7
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
 b=ieAe3Bw7+svdP7k1Mjdz401VBfKR3/7YLZCGmTm8EmDpk7J4l9MOw3KEHCRW73SRch
 a3RNuwSe6ZVBG3FlSJ+1mYWZyJoCfEXlQxCXtPxOxkztXiquD2aYfJ/zgeRUzz6JEYDQ
 EjPLPISATbExLjLKZ63Bz4qlX5KZAWyCW9pnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rKj/83OeNdCA+dbfZ2qmOiBrnBwHoQueKWn2gnvfSB0=;
 b=F2/fR+UPpNq7J405JLlv9fqfSXNMy2Jc1ZTpS8EM+plE98keT8LjdholmqYVPN+2oP
 ghpclZU/TepaJWZFOII+XmYcm72CR19h+MWnDJAOZul+U7JwmRwY7+7SvpjKtPBWzXnx
 0yQtLUqr/vhhJdQ11Ka4s03kyDzCbg2eMh8jIPFe84kDXoIbL2QN9VgRzGMfxjY6G8pE
 hCo+lg3Ri/rnLlHMLajKqmyJgNWLKzd4JkfhleUCaYC/SoPpL+vSFUtn3tTbduDudSIj
 Av0tzoYytEQfXzTenRPxdv4rTKexDDzLE3fQaY//Z0LA9lQyDpOEDv9BqPyUOXPiErMx
 Dong==
X-Gm-Message-State: AOAM531RlUHGtVpHsv7NukPW7zNcSEfIazYme3Gi/AniByDukzlsjv7/
 DoWpd8NB1y/Js5rJd3NA5i3efqCyHPD9/O/oa7gH/Q==
X-Google-Smtp-Source: ABdhPJw5Yk430/3/87e3yVE4qWHJlRhItY1gx4i906WPQT9Xp//a9PTHnqUQU02bFgspQY9SZ4ux9MZ5XkOnesX7ZOQ=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr285417oao.8.1644977904573; Tue, 15 Feb
 2022 18:18:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:18:24 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:18:24 -0800
Message-ID: <CAE-0n50-asrL6FcpsteqfBWAVMXVShFWW+yMSMvzzJOr7d0KCw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/6] drm/msm/dpu: remove always-true
 argument of dpu_core_irq_read()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-01 07:10:52)
> The argument clear of the function dpu_core_irq_read() is always true.
> Remove it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
