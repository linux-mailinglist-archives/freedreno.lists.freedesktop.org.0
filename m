Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE7163598
	for <lists+freedreno@lfdr.de>; Tue, 18 Feb 2020 22:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749B16E408;
	Tue, 18 Feb 2020 21:58:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6C36E408
 for <freedreno@lists.freedesktop.org>; Tue, 18 Feb 2020 21:58:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id z5so628219lfd.12
 for <freedreno@lists.freedesktop.org>; Tue, 18 Feb 2020 13:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
 b=kdpjP80seFPRBqxhxIpalWncJhJycuWAQPQT0uf/BhAioMxpA/HQSrB4FFdQP+vo/L
 KzZMVoRXpw4PUTQavb0o6cZHHaGKHSVcOUgix+7f/NfUfAl9aCz7L0/IbtVECP3Hmx5k
 uQFJiRqinUNrrBdMEj/yIhEp3RBT2Uxd72BlqR4nMUwzHAyMKM7YPchqExAMmNWGqoBi
 Ph19zMTGlFHeCAUda62180ibnNyy2wl7eOxbVuLhU6Jsy9cLpevU3SYjCp9Zrk7UP43A
 VMce/XyzyXhUBuaWX2tdTaeUxZdF5O1Zs8APWnkdHzTNx1e2XTvdK45WjNKQLPXeMS0F
 1T4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ahpk/GappiCcM5wW00z5eRTm7XSNbwAT9p1AedeyQaE=;
 b=ENGefEaqbP6Xj7qmHGy6MR1PRPTCGvs8AgsZftpDwCXyydBDCGzfBsFR73Bcf0uyNw
 r08fxFyJwHtK5R+jIhso+alyhfHFbEqyVXEv1fXzwdMiJpBaZz0pZy4hU5M9pzoBCHHP
 nvHvw0WUsNToBOis9XFD8/jPSafnK6VfRVVtmQWeuIFVV4jhcQiTa1qYY1EgOo9PZ6XR
 TQYoOnkrJjlD15+uZVA20Sve2Ro9Dn1EFEFHswrTrjhdcNwhZqc4R1IRrum0IzZX+zTU
 X29gvbLBj2nP3c09+K1OxF/6Rabq0BNdXz+MPY4Jqd1qR5HRA6d0jhef7ll0h9wsYYpt
 zarA==
X-Gm-Message-State: APjAAAUi2SR41cWfwHw+9lsfjUDPAyB7b1EcxY444l49VjslQOg0/J3s
 7uQRjj/du3fNjWTBlMLcswFa07DlV607wflE8LLJ9g==
X-Google-Smtp-Source: APXvYqwfJ/KjDHUqMyRYTcya4wxUGjDyhjQGBQJimj1/3xX/vD0XeMTB9CXlS07iJHjcgr5dOlc5NuiOgM8QWSquNew=
X-Received: by 2002:ac2:4214:: with SMTP id y20mr11460778lfh.212.1582063131075; 
 Tue, 18 Feb 2020 13:58:51 -0800 (PST)
MIME-Version: 1.0
References: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1581705404-5124-1-git-send-email-jcrouse@codeaurora.org>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 18 Feb 2020 13:58:39 -0800
Message-ID: <CADaigPXdn84cR0Pu-uLnCwOVHNUiOi_t6u7OYYDU6tkSvdWp6A@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/a5xx: Always set an OPP supported
 hardware value
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Wen Yang <wen.yang99@zte.com.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 10:36 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> If the opp table specifies opp-supported-hw as a property but the driver
> has not set a supported hardware value the OPP subsystem will reject
> all the table entries.
>
> Set a "default" value that will match the default table entries but not
> conflict with any possible real bin values. Also fix a small memory leak
> and free the buffer allocated by nvmem_cell_read().
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

This does fix my warn at boot on db820c.

Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
