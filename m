Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33198915618
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 19:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0885510E265;
	Mon, 24 Jun 2024 17:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XtMvyubE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F38E10E265
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 17:59:37 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57d20d89748so4389839a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719251975; x=1719856775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZIAIWt1Z4eDmMTYINpUjLJ9mlruxPvEMQ5OTZoQ2ABo=;
 b=XtMvyubEYpT7BdwZvsFW2USFwYGqH+oPy9B8ScZHbgbtEq79G6SqS8g43LtwkDKgMW
 zItpNBmWn8hIZsnF44XyagL7RP+MXf+AtUP53RghctvCJD8Yc+aDvFFmUUiGNbXZ80d0
 sAd5PWkrPmofxN0zawAIzZT9OU/GQw1wagoQ8tajrreIEG1oMI1Vu5swoGmyL+56t8vH
 EIB2GX6GWLxNcjf7e1ZTD8m4OB3HIG1Ba4z6imai7CURjdQ1q9ItEvqjBJIrOJODJg+I
 QyxM/BPjkYnrWkJKqDx4K1VTGNdslYzmE2Vspz55q6q7WPtMmBkqb3b68S3fRGRo46dx
 3+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719251975; x=1719856775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZIAIWt1Z4eDmMTYINpUjLJ9mlruxPvEMQ5OTZoQ2ABo=;
 b=b38FRstDxJNbTHENMOsc/X8oHQHdqmQ7Q+PQ3+vsbPpnd15rGvLRAjhCt3cKKFWO27
 6AZDM6hEyoTNkDbP93gYfWtmS1lV+JQi3vD5hpq7USbklw1nqjyPLxol8VK9r7Loyq/2
 LRM/slogAeIur0s0ZerVT4p/TZS1tvc6xLBNvLjdH4JVklvHUFU38BntifWFz7HVwTqr
 bapok2+Sb8m0h9jsZmGk7+q84OQjdGlnMkiAZzmlk4NVk2xk54BKLffvaNUdf3gCjgEr
 +pvTEDuNvKFASzaClSyVO1qL7au589nrHYJcsrUYFAKNOUGF1ZinjhGDWc25qh1Djn1u
 82pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWv/yDFulW+11Zp9GTPwmGHU6ZnBuD1nZfyppVmkHbzJv0gmbjI/3b2ZRNlHqNuDn1uEEwQp68Pqg51kb8CAWYUMQ6NRji/2MItCi1VWd
X-Gm-Message-State: AOJu0YxUIPlu32EcfUHx5+lXVCHhbvXNFpEm4C5hjkJtFvjoFQChptTg
 7PJtLCoAb+clkxxJkZq0rquiQdDLMA5K+nZahMvo/sqpdEd2nFVh0LwL/Q/QIlquOWAAz3OlBV3
 sNkP2nH6ZPnQM812JLWIhsxK36mg0CA==
X-Google-Smtp-Source: AGHT+IFNrTbtVRMR1bNA/VkMsDt63271yjVLvXvkXcuP88vnraU7GiWcQXI66OvIraPkqnoiDENoj1UsWzOIPOW179k=
X-Received: by 2002:a50:8e53:0:b0:57d:105c:c40c with SMTP id
 4fb4d7f45d1cf-57d49dc29d1mr3725659a12.24.1719251975388; Mon, 24 Jun 2024
 10:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
 <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
In-Reply-To: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 24 Jun 2024 10:59:23 -0700
Message-ID: <CAF6AEGvwCXj7=_A=f+A_G9k=1LSSjcrsHB0GN83Z2OKg0eWjMA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 MSM <linux-arm-msm@vger.kernel.org>, freedreno@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>, Bryan O Donoghue <bryan.odonoghue@linaro.org>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Rob Clark <robdclark@chromium.org>
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

On Thu, Jun 20, 2024 at 11:48=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> >
> >
> > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
> > >>
> > >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@fre=
ebox.fr> wrote:
> > >>>
> > >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> > >>>
> > >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> > >>>>
> > >>>>> When create_address_space() fails (e.g. when smmu node is disable=
d)
> > >>
> > >> Note that smmu support is going to become a hard dependency with the
> > >> drm_gpuvm/VM_BIND conversion.. which I think means we should never g=
et
> > >> far enough to hit this error path..
> > >
> > > Does that mean that we will lose GPU support on  MSM8974?

And display support as well :-/

Note that GPU should be disabled by default without smmu.. you can
override with modparam, but please don't.  It is incredibly insecure,
you might as well make /dev/mem world readable/writeable.

Is simplefb an option on 8974 or 8226 to keep display support?

BR,
-R

> >
> > Yeah, that was brought up on #freedreno some time ago
>
> Also on MSM8226 which I also care about...
>
> Anyone at all knowledgable on IOMMU would be very welcome to help out
> with IOMMU support on these two platforms (and anything else that
> old?) in any case, since me and some other people have looked at this
> (on and off) for years but haven't gotten to any stable or usable point
> unfortunately.
>
> Regards
> Luca
>
> >
> > Konrad
>
