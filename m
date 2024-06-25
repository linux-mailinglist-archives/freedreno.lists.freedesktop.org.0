Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0233916A7C
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 16:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89F10E1C4;
	Tue, 25 Jun 2024 14:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BhA5kCkf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B5010E1C4
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 14:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719326048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MIN/VifJTA2B+OiET7C3xPo4EAKT69eV2y9I0nZx+LY=;
 b=BhA5kCkfSrUI/NbVTSsQskDEFNYrSW2SiIEuLUm/2VWstk1Sy1lAKdGIw1O0xMLk0iNtat
 FLnTdOGi+YwNXkgqpFzD8FCPVbGxEsItl2kflL7OGhTocZxMBBdeuoaxKvktsK/BTKYCO7
 h2dRuP3q75ikEErCgIGC2p4ZxkX0jFs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-uBvQxDSvO7OYd9T4L-bf1w-1; Tue, 25 Jun 2024 10:34:06 -0400
X-MC-Unique: uBvQxDSvO7OYd9T4L-bf1w-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a6fcb1a708dso241993066b.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 07:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719326045; x=1719930845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MIN/VifJTA2B+OiET7C3xPo4EAKT69eV2y9I0nZx+LY=;
 b=n3pOC5zVMoxR6+eP6GfIL3MIJml48Mg2Rr8Lm5sjturHxwOEyVV4TDXdY+cMg1fhyc
 u742jkk93kfFAcNr45jrwVFbjfby6iJO0hY14NDYAmDVf0cUeYhejVJezJbN0nHFvOMP
 wOid7UViv3IIAaqkRgRcq/iAlpvqWGr/mPmEf12C2TE/pJePzUNXLjGxH/yq1eUw6NE3
 miQP12U5kjTsbS9TIY2E0hfi7ZgO+Mqafxlh0gyHPUSPlhbdw8dg1YgPNvPP0DEEf8FK
 Gys3kA25If2B18yQtui8g40iLUT01cKcwVsNhRh7DqPET9lbqmiuTdu7odbpj4+W1Lu9
 9NRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJDGg2+hkItApm90dv6YnGZ+HM8PUJSBTUpOp0+NxMrVmtVELy5K1bJQ+HTeAZwcCFJWwnMLLJCkxU5jYFfITk3woiLFshP7N0+ks+6m8u
X-Gm-Message-State: AOJu0YxcNKBoXSpcqwWAIbVOnwE2oGWxamaLYpeq4/CCxmbBNGIzspic
 ndOhC+5BYYnNeXwlpNbHsyg1ZyLDZ7cuE+VAndkUoLeL3V27hufl7tReJMO8cvh43EnXYVpDrWy
 yAWKv+VS78aq7OoqzNHPhmmBy9veTeUZ7YSGT+SdonRh5FO4oe84srUrpsG0ph1HBo2oFIsCHwP
 dXmFJu3PK16IpxJ6jvtQZGtgDEaGiw0dhKqwdf+LJD
X-Received: by 2002:a17:906:6b10:b0:a72:5226:331d with SMTP id
 a640c23a62f3a-a7252263f95mr367042966b.70.1719326045606; 
 Tue, 25 Jun 2024 07:34:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNXFbVuUgGr8Wezd7LUNQD2phD9UlLRzBQatK/pD7dVZ3A6LOVw5i0GmaQKcISJjgnq3eBPshrZyew8oltNwY=
X-Received: by 2002:a17:906:6b10:b0:a72:5226:331d with SMTP id
 a640c23a62f3a-a7252263f95mr367041366b.70.1719326045275; Tue, 25 Jun 2024
 07:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <64ec16b9-c680-408c-b547-5debae2f7f87@freebox.fr>
 <dkmtnizbuyswyvocczjfgmhsuedawliabycig4urw42a65hu3j@jglxzumuzamd>
 <a9e4dba6-2317-4b6f-968f-d607937f5157@freebox.fr>
 <CAF6AEGtvHzF-KNyMwmysz7idLYE7XuXhDnBLdQFFhEdgYo6oqQ@mail.gmail.com>
 <CAA8EJpqCmu+TPmdCxwa84s+15inmdi6SeR5XQRVey56RKqdRuQ@mail.gmail.com>
 <717ee43e-41f5-4940-b404-c348812c84c9@linaro.org>
 <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
In-Reply-To: <D25HTBIFDM42.2W1WGS8HKTHTF@fairphone.com>
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 25 Jun 2024 10:33:52 -0400
Message-ID: <CABx5tqKhAYsD_Yd0TnouVmrwbA29yJF93CEGkzuyOJgc5UY2PQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: log iommu init failure
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Marc Gonzalez <mgonzalez@freebox.fr>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>, 
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Fri, Jun 21, 2024 at 2:48=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.co=
m> wrote:
> On Fri Jun 21, 2024 at 12:47 AM CEST, Konrad Dybcio wrote:
> > On 6/20/24 20:24, Dmitry Baryshkov wrote:
> > > Does that mean that we will lose GPU support on  MSM8974?
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

I posted in 2020 some details about what I encountered when I tried to
enable the IOMMU on msm8974:

https://lore.kernel.org/lkml/20200109002606.35653-1-masneyb@onstation.org/

Brian

