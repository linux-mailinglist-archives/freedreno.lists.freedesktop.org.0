Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEE441FC3
	for <lists+freedreno@lfdr.de>; Mon,  1 Nov 2021 19:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2306E453;
	Mon,  1 Nov 2021 18:02:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5106E437
 for <freedreno@lists.freedesktop.org>; Mon,  1 Nov 2021 18:02:23 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id h2so19292093ili.11
 for <freedreno@lists.freedesktop.org>; Mon, 01 Nov 2021 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
 b=JY8uJTVzX0Ut5XrdC7dgInIh7GV7XogEtOsPZDF0iBibhsdEyA2fur4Td5p/bBfbP4
 oMAGLpI6qDbHoQvCijJI9XalSLExjH7lI1CJfN3K/r3kltW5RRKMIGLcxEp/0FDCQvzk
 J88GY6szvCD0jZogUoNp+4HFUlPG2WGbLBzpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AI0EGtO0fwy8ABQM2b3fEK3eUYU6jqjRFDdZhYpaGeo=;
 b=Ncd+fjAbvKoQRB04Y7boNDbe8+HWeXeJBiszJfnfcZW2VDVEFXfIqGx69KZmyczA2N
 JYqbW9w+/gBSp4XeqD5gezPML3h01U8yW+PgLHQUDFYwZWcqhOYv+stBdCO4+Vg/6lMz
 iS8VSP0DeDz4/fqxIHVnFRjZDuIZ0+o/+IsAA0oPYswzALLadxgbCEhEcRNGZS0x5wDY
 fgf8/ZBlNOaC+HeL9fOYGsEX62O+5M9sqKf4TGohj3WincN2N+5cU5UK7l1O2sHg02jy
 f7oGQyNpAACy7Mi2o7v5b5MNeiU7KpnparTQkQdh8oL/bIfneUSIPPk2utrKHeE4uOSy
 LoSA==
X-Gm-Message-State: AOAM53384Xd96FiHN3IxQr6HndoxVyKkq6/rSxybSk3WdbDF/79QaFt2
 SJBY+2+nGfTKSlV59+brDUEo4VhzOfaayA==
X-Google-Smtp-Source: ABdhPJwHVPeNYhXhFERSgo9n3fFWGy9ozFQ+JH06coECNCt7mqMLPHUIpVlhcYrCpeDDw5STKJt/AQ==
X-Received: by 2002:a05:6e02:158c:: with SMTP id
 m12mr21625412ilu.64.1635789742351; 
 Mon, 01 Nov 2021 11:02:22 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com.
 [209.85.166.50])
 by smtp.gmail.com with ESMTPSA id t14sm691476ilu.63.2021.11.01.11.02.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id i14so22507147ioa.13
 for <freedreno@lists.freedesktop.org>; Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr8257662ioo.136.1635789741166; 
 Mon, 01 Nov 2021 11:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
In-Reply-To: <20211030100812.1.I6cd9af36b723fed277d34539d3b2ba4ca233ad2d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 1 Nov 2021 11:02:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
Message-ID: <CAD=FV=Xoaypn6wy5mHfTneDrQYexGcdcaMqkSnPJf0YS=jHpPA@mail.gmail.com>
To: Philip Chen <philipchen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: set default num_data_lanes
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Sat, Oct 30, 2021 at 10:08 AM Philip Chen <philipchen@chromium.org> wrote:
>
> If "data_lanes" property of the dsi output endpoint is missing in
> the DT, num_data_lanes would be 0 by default, which could cause
> dsi_host_attach() to fail if dsi->lanes is set to a non-zero value
> by the bridge driver.
>
> According to the binding document of msm dsi controller, the
> input/output endpoint of the controller is expected to have 4 lanes.
> So let's set num_data_lanes to 4 by default.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
