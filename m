Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB9915949
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 23:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2329610E155;
	Mon, 24 Jun 2024 21:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="C+k1zTyX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC80B10E16A
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 21:54:15 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-57cc30eaf0aso2790898a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719266054; x=1719870854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sY5Zh+sZGJTn9InmhZn+JpSx2JdQvo8kESASgJqojTU=;
 b=C+k1zTyXcEg2YPYMye3/xfTJ/PObiSwMS1//uo4bnaIzxZ7MA2gDoF4BEiYYp1K7az
 S0OjdNcbIuBFDfTlXZgm2ufsQqlauwKXwCAXTQs2y0G1uqrBo2Ak/cDndLhgMNg2Y1XY
 PU82xP+fL6z9bwMO/uNT1hk5e2tAmjmizbyj/EulMVvIrB65hcC6Z58hP4XcvYaDMe4z
 GR+gmOc6/ML7krfAbOfSR4iuTsELgt2rKbtllF8NnGF9ISRsmHdMBIk+z2mxOUj2Ex2b
 TgIWAzY1qG0CZ+IU6OkErBCsoSCkBBVMVgFLkKqTcGC9R8OCuKzsTrfSVXbYSzaZj16m
 mNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719266054; x=1719870854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sY5Zh+sZGJTn9InmhZn+JpSx2JdQvo8kESASgJqojTU=;
 b=vtFsXdPzWlPwRUHKOanSd00qO0gqS9qpiQIuyLhEHjCtHqB+1DTet3Bwjj3MWUiA3K
 0MU7xvcC8eOn4fXRS/sygJ59BSsTN4PV11J1zualOlEUzuQJ4rIgsodY2m56NQ8njlgV
 o4qsMrZ0NKnFnc5Uq+saU6+rCO8AclLYU03VTQl2RTfJ2X773i7bbg+L4BlYP3SDhQ5x
 Zxg1600hsslkLcy+JstfZQ0rvRk5BFqpqHw7tXDTfWWp2hWUnP1Nhye26z1SYdUeq1Fz
 x6zUDUQJFtUIMeoGYfRveymqKdmI/494KVMqm/7msf9+z0A8P7o2S1ji2XwQtxGOBc5x
 Zabg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvFhCiDOK0Q0EVDJzzRNto7aJEXSD0p+2YFjT2UN53nxtnpI3M7BHXO2jD3VD4nWxfwQZoQutwnpSQuDBP1zCxge/q2OAOAxpZS/rTbLlB
X-Gm-Message-State: AOJu0Yw1NeKstv/afd647/bBBH1/EGlV4F1Sd1NyidxX+px3yMEM7n6f
 Nvu19XN8chsGMOnLJvfGGeDEePrHZbsVPig/NxWFP4pg6tahWynJ3WvJdGpC/a+TtyBX+Owdk56
 92+mgJwbVd8MO99LLtnvfj174L0U=
X-Google-Smtp-Source: AGHT+IFlO6mE5t9frydCQN+/Yhc4G3eSyEPhL5nKtOMuGvqS8bghROCeDRxKANS/FbEHSdYQRTHAkzuOkRJX4ml/jUM=
X-Received: by 2002:a50:9f6d:0:b0:57c:671d:8455 with SMTP id
 4fb4d7f45d1cf-57d4bd728c8mr4277655a12.14.1719266053800; Mon, 24 Jun 2024
 14:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
 <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
 <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
 <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
In-Reply-To: <CAA8EJpquKb0r=ZDABU0F+PGR1PKNTiKELbGe1-4Wd2pVEzVUNg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 14:54:01 -0700
Message-ID: <CAF6AEGuMxO_WO3Jm+wLHX_VQApxTqiF6RekBY_oMfAiumT5u-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Rob Clark <robdclark@chromium.org>
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

On Mon, Jun 24, 2024 at 11:29=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 24 Jun 2024 at 20:59, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairpho=
ne.com> wrote:
> > >
> > > On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > > >
> > > >
> > > > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wro=
te:
> > > > >>
> > > > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez=
@freebox.fr> wrote:
> > > > >>>
> > > > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > > > >>>
> > > > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > > > >>>>
> > > > >>>>> When create_address_space() fails (e.g. when smmu node is dis=
abled)
> > > > >>
> > > > >> Note that smmu support is going to become a hard dependency with=
 the
> > > > >> drm_gpuvm/VM_BIND conversion.. which I think means we should nev=
er get
> > > > >> far enough to hit this error path..
> > > > >
> > > > > Does that mean that we will lose GPU support on  MSM8974?
> >
> > And display support as well :-/
> >
> > Note that GPU should be disabled by default without smmu.. you can
> > override with modparam, but please don't.  It is incredibly insecure,
> > you might as well make /dev/mem world readable/writeable.
> >
> > Is simplefb an option on 8974 or 8226 to keep display support?
>
> Not in a longer term, I still hope to push HDMI PHY/PLL support for
> MSM8974, which means dynamic resolution support.

Hmm, maybe it would be possible to re-add carveout support.. but my
hopes aren't too high.  It would be better if we could get smmu going.
(Not to mention, I don't really like the idea of people using the gpu
without an smmu... it is a really insecure thing to do.)

BR,
-R

> >
> > BR,
> > -R
> >
> > > >
> > > > Yeah, that was brought up on #freedreno some time ago
> > >
> > > Also on MSM8226 which I also care about...
> > >
> > > Anyone at all knowledgable on IOMMU would be very welcome to help out
> > > with IOMMU support on these two platforms (and anything else that
> > > old?) in any case, since me and some other people have looked at this
> > > (on and off) for years but haven't gotten to any stable or usable poi=
nt
> > > unfortunately.
> > >
> > > Regards
> > > Luca
> > >
> > > >
> > > > Konrad
> > >
>
>
>
> --
> With best wishes
> Dmitry
