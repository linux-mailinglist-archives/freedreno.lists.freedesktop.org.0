Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3E880484
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 19:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1B10EB60;
	Tue, 19 Mar 2024 18:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="i2+/80of";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE3D10EE97
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 18:16:06 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-690d054fff2so37242426d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710872163; x=1711476963;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
 b=i2+/80ofZVtM05BkXt7ArvMgWjgEDj7XdQnffN/OXp24El3n/5eG5SGqa+btqBBT4B
 ErpGd8iUmQx8yEL5OtB+63GKL4b3TIXQdQFCQxuxySJmmQ8gq4siXjHvyBacUqvd1FXo
 9kUZ6fPAHISKaPo1up2ewi7lo3HUQdT0qmkIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710872163; x=1711476963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TY3JC7lCg0J0NbLsthogiU7IlW38IYTYvI5MHCluIsY=;
 b=GUmQBPM1CeC2FksnFbMXebHCudX7KrSDMfpcBQyb+ZaYugnVuMLLCKCTxt9NYHENFk
 wYM4pGdbHVjF9/shUr47fv40yoebHuBkRpiGIRaQ9smRYVIq5zkAwvQSl4zz/QRFkM39
 kHCHlKUpFPwDRbzUniFKqeXd00/pW7IWcmeUyMsCrztbMSCtCjS3GR2f3hpjBSR2h3qR
 LHu1AF9wqNI92zB4AMoLpqv6m6seOLb5zLGWjPhr0iQqUxuHXXVZP/bPdzJINsvUn/vR
 /8ln3+WxnKkO1+o024blly7T1N3nI0S3Oys7Fv7OJ9hshb7NkJoGHLQHKREOo2pq6cw9
 /6ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJq8OoBb+t0Mka6bfc6UhTYMx2ZF1gEan8sPNXNfNp3QRwfpKBFUd3y22GslFu+5n1FiIokbDeHcPfa5ZHzXAwFVRFTIzDxZIYYu6Di5xT
X-Gm-Message-State: AOJu0YzHfR9l24Bcuc+J3K0/sZ/j3Fb0fjLf4DmTkmQmibXkB4dJj/IO
 ovCodByfa72KlH6b861/So3iGU3JyEeSvLf6LC+OzpKlC2qqTIMQDOjE7lGHOKb90s3njyoxcJ0
 =
X-Google-Smtp-Source: AGHT+IFXl+BPFbPPjo8V+Tz2AyhYjeUqNm2c+N2+5ohiLqVco5Lb85EnqLvplEORk0bFiu3K6uk5GQ==
X-Received: by 2002:a05:6214:aa8:b0:690:d5ab:12b1 with SMTP id
 ew8-20020a0562140aa800b00690d5ab12b1mr3393091qvb.2.1710872163097; 
 Tue, 19 Mar 2024 11:16:03 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 gs7-20020a056214226700b0068fcfef2077sm6750479qvb.93.2024.03.19.11.16.02
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 11:16:02 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-428405a0205so42611cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 11:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVtCQ5P0v1QX2PBf7ZHBnPZZEUiiRb2+rzfuvubzoC3jC1sZAQUf7Wuabwa4LwvXuYCS0fs8RKDyXQgU4wASEunl10VBYJCLaWDjtymARcl
X-Received: by 2002:ac8:7f0d:0:b0:430:ed72:bc0d with SMTP id
 f13-20020ac87f0d000000b00430ed72bc0dmr39379qtk.26.1710872161807; Tue, 19 Mar
 2024 11:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.3.I535606f6d4f7e3e5588bb75c55996f61980183cd@changeid>
 <e2319b19-d999-24e7-48fa-bbc19bbfbeea@quicinc.com>
 <CAA8EJppau--vt3RLkH96K0SF2x-QGWz+5U8tErvLFDvz-GQN4Q@mail.gmail.com>
 <d04711c1-6df0-f988-9227-2161f4109dd1@quicinc.com>
 <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
In-Reply-To: <CAA8EJppcuftv4hfKkZeaXCDQJ4Z5+8-P99wHc9X8WgYJbk6CjA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Mar 2024 11:15:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Message-ID: <CAD=FV=WMbqmU1q+6hJZV9a16PdPUtdDJuMmsQ1wb27jDdeQFmg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dp: Delete the old 500 ms wait for eDP HPD
 in aux transfer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Mar 19, 2024 at 10:27=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 19 Mar 2024 at 19:13, Abhinav Kumar <quic_abhinavk@quicinc.com> w=
rote:
> >
> >
> >
> > On 3/18/2024 5:55 PM, Dmitry Baryshkov wrote:
> > > On Tue, 19 Mar 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.co=
m> wrote:
> > >>
> > >> +bjorn, johan as fyi for sc8280xp
> > >>
> > >> On 3/15/2024 2:36 PM, Douglas Anderson wrote:
> > >>> Before the introduction of the wait_hpd_asserted() callback in comm=
it
> > >>> 841d742f094e ("drm/dp: Add wait_hpd_asserted() callback to struct
> > >>> drm_dp_aux") the API between panel drivers and DP AUX bus drivers w=
as
> > >>> that it was up to the AUX bus driver to wait for HPD in the transfe=
r()
> > >>> function.
> > >>>
> > >>> Now wait_hpd_asserted() has been added. The two panel drivers that =
are
> > >>> DP AUX endpoints use it. See commit 2327b13d6c47 ("drm/panel-edp: T=
ake
> > >>> advantage of wait_hpd_asserted() in struct drm_dp_aux") and commit
> > >>> 3b5765df375c ("drm/panel: atna33xc20: Take advantage of
> > >>> wait_hpd_asserted() in struct drm_dp_aux"). We've implemented
> > >>> wait_hpd_asserted() in the MSM DP driver as of commit e2969ee30252
> > >>> ("drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()"). There=
 is
> > >>> no longer any reason for long wait in the AUX transfer() function.
> > >>> Remove it.
> > >>>
> > >>> NOTE: the wait_hpd_asserted() is listed as "optional". That means i=
t's
> > >>> optional for the DP AUX bus to implement. In the case of the MSM DP
> > >>> driver we implement it so we can assume it will be called.
> > >>>
> > >>
> > >> How do we enforce that for any new edp panels to be used with MSM, t=
he
> > >> panels should atleast invoke wait_hpd_asserted()?
> > >>
> > >> I agree that since MSM implements it, even though its listed as
> > >> optional, we can drop this additional wait. So nothing wrong with th=
is
> > >> patch for current users including sc8280xp, sc7280 and sc7180.
> > >>
> > >> But, does there need to be some documentation that the edp panels no=
t
> > >> using the panel-edp framework should still invoke wait_hpd_asserted(=
)?
> > >>
> > >> Since its marked as optional, what happens if the edp panel driver,
> > >> skips calling wait_hpd_asserted()?
> > >
> > > It is optional for the DP AUX implementations, not for the panel to b=
e called.
> > >
> >
> > Yes, I understood that part, but is there anything from the panel side
> > which mandates calling wait_hpd_asserted()?
> >
> > Is this documented somewhere for all edp panels to do:
> >
> > if (aux->wait_hpd_asserted)
> >         aux->wait_hpd_asserted(aux, wait_us);
>
> That's obviously not true, e.g. if panel-edp.c handled HPD signal via
> the GPIO pin.
>
> But the documentation explicitly says that the host will be powered up
> automatically, but the caller must ensure that the panel is powered
> on. `It's up to the caller of this code to make sure that the panel is
> powered on if getting an error back is not OK.'

It wouldn't hurt to send out a documentation patch that makes this
more explicit. OK, I sent:

https://lore.kernel.org/r/20240319111432.1.I521dad0693cc24fe4dd14cba0c7048d=
94f5b6b41@changeid

-Doug
