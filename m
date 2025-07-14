Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CB7B04842
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 22:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA8B10E0D5;
	Mon, 14 Jul 2025 20:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mx1UGOQy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2310E355
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:09:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA2kqx009120
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=LR7DJLBr371ZvWFey7V16qQwMz2IBYn4TcJ7HsIZaCY=; b=Mx
 1UGOQyjdVLYLElOWQ+tzUpkAXc1Lcx4OjwDz8UDlJAP/UyqmILxL93zDgAwNExV5
 FGYzsqYYDwTwvOxEedA3c0LtCLDxJwJFyy4KsNvZlWrx0v1seknmx2Pn2ob32G0h
 X246PaNdBxEAXH9vA6r5p9cdvhFUz6VdT6T7qpCArzau0IDJf8zBoeDnrgAMBYaH
 o3XQ+jU9lhI34yUUh7FTgGBtAexbwTkIz8QuMnNTAuJScsGoDLMaO2EAMe2dbONB
 ip7HCgbHUfE7dsRlA/Qja797gfGsxUAgIa6BziXlsW3l2gZC9z5mDhJlhv8VPwyw
 KHhppZXBcdeLnellWzHA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut5q4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:09:11 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-41b4a69ddc2so222450b6e.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752523750; x=1753128550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LR7DJLBr371ZvWFey7V16qQwMz2IBYn4TcJ7HsIZaCY=;
 b=en2PMMyjttBZqcQSupaCI549duC6hg9wumYBaoSVQeLgjywqNqlibdKYbC70KqOrRG
 u9IU+GeFAyshsjvao+VxM+i4uhDsWxbjL+oA25xQLx1xgfu0DUdLYfMcQUC1ztmQLd8G
 ina3Xl0mVHzuwsVACdfLemoAhn0GTtc+6Dd+68w20BRrmi96gSTaM1Y4SxYo98F8IFKO
 TQBVEFw2OL2/1gzkL8PpXGPgOvbrWxXf+PP1GOhJn/VdLmZMXJiiqTNgaFlmXDGI1uKY
 V3c72uSl75imclbcYEup5G9Sr1DxlmaEOcCTJgH/mW1GhQv43zSl/93kD4BYi2DczFo1
 QQhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtxJHWz2HwMeh1D0z+pGz6SrrCUOaL6aJtIvlA8FkxZAeACxEprgDwkJ+vrxq2FgBjgst/8kjbuw8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTYldn4AvWYyS8YDE6+C0Fiy8qq9WoPyJSOlBchR+aeNbDKkCa
 uP6/nseVhpVAxjGwBZjhPPsb0D9XdFZkIJoeSdcXFGhg7b+WEInFkxjtgyUv8HKOYUmozmChL/O
 rPdENQQy+DltLDsZpQ7lo0Zc77IZOLdnPFv4jkgsFUG3Ey3HCv7IXW41f/oxCgocL0dLSu21rBo
 +yGgTRlvN1SEPlqPx1sqU/4AuqqE4+li+Gdh96aDZkNPUpuw==
X-Gm-Gg: ASbGncuOzGSxvU5SW4qXhXPZAUMJG3jm7zureZT8kGj0t0+QxcGIuKJizgD9uXL3kOF
 f7duazN/YN3qya/HIlG3jVFvclUva/qHjZGVmE2q9g3tcBwyP7b3riPREtTwQQd3+QYH+mlxLs9
 lPXdX2Ox3Oxwre0vxYmxW2kU7RQ9wuFnk40qrVnK8QL3u8MKhPdnu8
X-Received: by 2002:a05:6820:5209:b0:615:73d7:1714 with SMTP id
 006d021491bc7-61573d78d13mr4217622eaf.2.1752523750256; 
 Mon, 14 Jul 2025 13:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeaOzmnBuIkphxKtr/iO5+vCVTpxEKvoFvIUraxopA2iAaj7ZDVHmxIEqZWTXVIp2qr1osE2m2bD+9zxzjPlE=
X-Received: by 2002:a05:6820:5209:b0:615:73d7:1714 with SMTP id
 006d021491bc7-61573d78d13mr4217599eaf.2.1752523749868; Mon, 14 Jul 2025
 13:09:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
 <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
 <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
In-Reply-To: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:08:59 -0700
X-Gm-Features: Ac12FXzhkgltGmhl09vK_3sIIje-U-wWELebiK9aDQ0FYeQT8NG_-WoOB3au0iY
Message-ID: <CACSVV01PkDKWSRq4eQCJGFePKmSKmFdkNFt2PSC4w+r1U9nZuw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Doug Anderson <dianders@chromium.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=687563e7 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=dRXE1jWJAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=nhpro71emhRR61KsPv4A:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=I84_JwFgYcz8Gf5-qaVM:22
X-Proofpoint-GUID: pNoP4ePaU5_s1sT9JCdK0boK4RddRn01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzMyBTYWx0ZWRfX8oxlOgnoAQu1
 eDIr1+QkfsqecpcjGsdHt1SrtZgsDuYN25gCOdFfrGmuuKxXEjrRZXbAOZJ/CZu0MNiKJsJ1sEf
 jCKNbNnrfCCHcnXtbGM9TCyiMBtDG0Ezzg+f8qyPLpk49jVqfJvSusFx7xegh1mj6ANtFos40va
 v6R4Ki9fK+KW80NSFCJlA5e3MKykAoeBghhl3NBNjnQ28vYeUdI4TnjDxLHdJTiUdrfkympbJTJ
 Cdr53UNlgtIi/yVXJH6qR6sZY3TBH23TBiPH+MTzhQYzefYsYY1CtJIExtp8RTT/n3hN1Jt6bca
 77L6JSYaBl7LSQpYK/jX/CJfZixFM5lwjo//8OqNmZN2wBrAHozDpYIYtF0FAPB+3Xd37Ak68DL
 xl/QL47uU1yEqoH8cdi0Hpe9OK1oPuszxXAO3N03WpYHWxz8aRMNiDzDDUccYoaN3g1DA3nN
X-Proofpoint-ORIG-GUID: pNoP4ePaU5_s1sT9JCdK0boK4RddRn01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140133
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Jul 14, 2025 at 12:56=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Mon, Jun 30, 2025 at 9:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualc=
omm.com> wrote:
> >
> > On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> > >
> > >
> > > On 30-Jun-25 15:46, Rob Clark wrote:
> > >> On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
> > >> <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>>
> > >>>
> > >>>
> > >>> On 29-Jun-25 15:58, Rob Clark wrote:
> > >>>> These runners are no more.  So remove the jobs.
> > >>>>
> > >>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > >>>> ---
> > >>>
> > >>> Do we have anyone using cheza at all anymore then?
> > >>
> > >> Probably not
> > >
> > > Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> > > get rid of it upstream, as it never made it to the outside-outside
> > > world..
> > >
> > > Konrad
> >
> > I am not aware of anyone using Cheza boards within Qcom. So it is fine
> > with me if you plan to remove the DT bits.
>
> As far as I'm aware, anyone at Google who had a cheza gave it to Rob
> to put in his lab. If Rob says nobody is using it then I'm 99.9%
> certain that nobody at Google is using it anymore. There were a very
> small number of external developers who were given a cheza prototype
> but I can't quite imagine any of them still using it.

If it helps, this is what the batteries looked like when we pulled the
cheza's out of the CI farm:

https://photos.app.goo.gl/Eh8EJhqBhKUuYfiH8

;-)

BR,
-R
