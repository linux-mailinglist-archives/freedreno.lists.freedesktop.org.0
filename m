Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C971B911C1C
	for <lists+freedreno@lfdr.de>; Fri, 21 Jun 2024 08:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9316010EA47;
	Fri, 21 Jun 2024 06:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="dD1cc5Bf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7610EA38
 for <freedreno@lists.freedesktop.org>; Fri, 21 Jun 2024 06:48:45 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-57d0f929f79so1478212a12.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Jun 2024 23:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1718952524; x=1719557324; darn=lists.freedesktop.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTPTYUIAI+cYSVFPE495y+YpJV2Jh1KvECgLTdMjZnQ=;
 b=dD1cc5Bf+fZeaFm+zRlx+h3BIZO9svGgI5UhoRxio3BnyX9AAAxT3aObiw6bs59CFC
 pPaqdwCiSQi7IPIJbUsSZ4cWJpuuY7wsKvyjtfaJLhcZqh50sLxtLPvdQ8T+GSvgUZ8I
 U8e1hdYkMdhoe1xNUR1o6ckQF4LA2UKqb1qVJElAhvhbBz6WkmNfXj8OrxWWj9vdd13u
 oSzk0B2/PBJohNtmOTQdG0Qh8+rIA8hZ6QeCoU6ZiBacSKVAHdHgUbhQowQrDwhTsylQ
 iI1ayLmw050X2MebKdfYw87iPFwyujaH6cAMxsAV/IGGH057WM6Y4+flBNm2XtOEchsc
 85rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718952524; x=1719557324;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WTPTYUIAI+cYSVFPE495y+YpJV2Jh1KvECgLTdMjZnQ=;
 b=BHzIEEyc4njLFg43feCkHejDOTGm1vujSiI87jpBh2YnSll5EgIH94zHrXrjuKC6Uz
 xtsD6DFz13cwXS58TAdV0t3XdG/qxi3Zc2lPUJgeYUU2OZFHIHbSjGOHLs4WrQGV3v3W
 VrpknBFTXSFzhRBety0fBld1VLfZwXSviamzhbwHQ7V9mI42Z4R+VQLDBCjhuQHlgw7s
 MIHcyJPkqkTfqrOT8u01s5s24DDWdmvVcvbCUJjLlLgJQRggXUbScF8pgIaw7mQo7TkX
 J72M+L2DLHt7Fe4fV+vswIoDuKFvucx6Ft2eefSJEftxJcGMJfiyYkxfE0bMQMmbo1rJ
 BGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXD1e3eA5N8HFoAvdFTCattH6PZBkSh6myIv4d1zYcqWLX+dar6/iNxMzgv5gIExUDADmLTIDMUtCfYJ+FyOFIp9yRD01rseJhL6i6HvSg
X-Gm-Message-State: AOJu0Ywd+MHy72ksT9u0zApf33JxQev/iCYNbAT7WPynV4sTywuhIrsH
 b1cYJvYNWIPk118/wxfvICsGzFJByhVhTPoQl5GVos11UUqqw4HQIth6MlCPVlE=
X-Google-Smtp-Source: AGHT+IGwrRaDa7rYvqZ77QTjkvkgem4Yvzeueo9WJucioWs1WL0pxaLkCCk657dD88oHfEueksJ/vA==
X-Received: by 2002:a50:930e:0:b0:579:c3f8:591c with SMTP id
 4fb4d7f45d1cf-57d07e5f0f9mr5559105a12.18.1718952523797; 
 Thu, 20 Jun 2024 23:48:43 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30413446sm509122a12.31.2024.06.20.23.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 23:48:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Jun 2024 08:48:43 +0200
Message-Id: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>
Cc: "Marc Gonzalez" <mgonzalez@freebox.fr>, "Marijn Suijten"
 <marijn.suijten@somainline.org>, "Abhinav Kumar"
 <quic_abhinavk@quicinc.com>, "MSM" <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>, "Sean Paul" <sean@poorly.run>, "Bryan O
 Donoghue" <bryan.odonoghue@linaro.org>, "Pierre-Hugues Husson"
 <phhusson@freebox.fr>, "Arnaud Vrac" <avrac@freebox.fr>, "Bjorn Andersson"
 <andersson@kernel.org>, "Jeffrey Hugo" <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.17.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
In-Reply-To: <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
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

On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
>
>
> On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > On Thu, 20 Jun 2024 at 20:32, Rob Clark <robdclark@gmail.com> wrote:
> >>
> >> On Thu, May 30, 2024 at 2:48=E2=80=AFAM Marc Gonzalez <mgonzalez@freeb=
ox.fr> wrote:
> >>>
> >>> On 16/05/2024 10:43, Marijn Suijten wrote:
> >>>
> >>>> On 2024-05-15 17:09:02, Marc Gonzalez wrote:
> >>>>
> >>>>> When create_address_space() fails (e.g. when smmu node is disabled)
> >>
> >> Note that smmu support is going to become a hard dependency with the
> >> drm_gpuvm/VM_BIND conversion.. which I think means we should never get
> >> far enough to hit this error path..
> >=20
> > Does that mean that we will lose GPU support on  MSM8974?
>
> Yeah, that was brought up on #freedreno some time ago

Also on MSM8226 which I also care about...

Anyone at all knowledgable on IOMMU would be very welcome to help out
with IOMMU support on these two platforms (and anything else that
old?) in any case, since me and some other people have looked at this
(on and off) for years but haven't gotten to any stable or usable point
unfortunately.

Regards
Luca

>
> Konrad

