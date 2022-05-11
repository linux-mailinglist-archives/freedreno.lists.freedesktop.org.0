Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC06523D31
	for <lists+freedreno@lfdr.de>; Wed, 11 May 2022 21:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B97D112B37;
	Wed, 11 May 2022 19:12:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCB2112B37
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 19:12:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id z2so5977382ejj.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 12:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
 b=eCbRkCpG+1uv8o7qRy4S8ofMtbzrfrNObimViXJYOfvi54JNTAr6JFhhlnpgtpAcS+
 VN1OH3CnIDFz9Ap8QJJbmVusIA88+j05i4dmbpolhuHRtJjOf6pV7NrV6W8AIKtloJuO
 Epo1XPPLAfd3d4t/rIpKYoMleVpcQa62xi+gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0rLYZTGM9tABUfYW7kAK/fqq3Ax7YNevFHH/XCjFGs=;
 b=h+fVvuKv7d6DuYcg9XUie21M89dcQV3YjLKZRDlRPlGHqiYBagzjoOC0swB6V+Yoml
 +NRqpuhALmhfK8O1IIgyG3lxaBZrtMbz7FtQ1X7iyGfI/pnI2u6DR7L/oksiCqWPu9Fh
 TgJFnqm30IvduKJnNMkfAcy+2laRqjzmvi8hzK7W7frMY5YHvq/tQ2s3rLsAp1kbjPuQ
 qXzebuSCY4DcluBgscQGcp2nTiCiXzaEh8LnWg9VR9dvBoFQhFi6XojKJN/HJ6rgg/AN
 WnA1reNMDTAbUvwWBNyXb3ACrMO5uqPPpL3G2ZI+2/ccksRXvzhV7KsQEKAfx2cBbW3z
 VYIA==
X-Gm-Message-State: AOAM530vEXiyoBz/8W4gmRdZLgsPy71H6IVYuvtR+anJQqnbqIMxymFY
 Ar6U4iZx9/2rlciRbQ5A5sUkoVOdmrau+X2+wCc=
X-Google-Smtp-Source: ABdhPJzOTR2MJ9ybbVvCAi7WPfNa9oJBp3+jhO2+NOKMGqUsQsSdwZR+gNYwhO8jsIV27sLNz/Nv0A==
X-Received: by 2002:a17:907:8c85:b0:6f4:6b2a:5f0 with SMTP id
 td5-20020a1709078c8500b006f46b2a05f0mr26660809ejc.491.1652296357254; 
 Wed, 11 May 2022 12:12:37 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 w11-20020a056402070b00b0042617ba63a7sm1550270edx.49.2022.05.11.12.12.35
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 12:12:35 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id h16so3600728wrb.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 May 2022 12:12:35 -0700 (PDT)
X-Received: by 2002:a5d:6dad:0:b0:20c:4dc1:e247 with SMTP id
 u13-20020a5d6dad000000b0020c4dc1e247mr24044515wrs.274.1652296354621; Wed, 11
 May 2022 12:12:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
 <CAF6AEGusO9XAqHNatJLgV+wpVoyyLg1vHtUsnSkAxJeV7n3WNg@mail.gmail.com>
 <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
In-Reply-To: <CAHk-=wjbE0f2AGroB1Hy=fx2fh7cRpS0wNdB46Ybk14Mb0b5Jw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 11 May 2022 12:12:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
Message-ID: <CAHk-=wjy4DY_ya8TBs9W2wLWHibBiHMQW2T43DQR1SGRkqD=gw@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] Adding CI results to the kernel tree was Re: [RFC
 v2] drm/msm: Add initial ci/ subdirectory
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Dave Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 12:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The kernel tree might have just the expected *failures* listed, if
> there are any. Presumably the ci tree has to have the expected results
> anyway, so what's the advantage of listing non-failures?

.. put another way: I think a list of "we are aware that these
currently fail" is quite reasonable for a development tree, maybe even
with a comment in the commit that created them about why they
currently fail.

That also ends up being very nice if you fix a problem, and the fix
commit might then remove the failure for the list, and that all makes
perfect sense.

But having just the raw output of "these are the expected CI results"
that is being done and specified by some other tree entirely - that
seems pointless and just noise to me. There's no actual reason to have
that kind of noise - and update that kind of noise - that I really
see.

                Linus
