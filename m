Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A7B523AA
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 23:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF25D10E9E4;
	Wed, 10 Sep 2025 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="afQSqLgi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539AC10E9E4
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:14 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ALcfVc022262
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=; b=af
 QSqLgi2w1YJVdrThDNuPd9hmdEaSNEqZYJC775XZYXiXqpZ6x+cbC88fQiSzO0pa
 8m3hc2VmCLSWcH2yVTfyCbJXBwVnDvxz9yFGJG0BF+rReKBoZuKTItEPQLH/OkiT
 u5MQLMGkPFPGc0THe4QoNRXFnjf2a/OCgDggVoafUGGhtfpvijOFkBtgPFnicRaR
 p6XaQxKnlptFJaN23Sl8buj06gh2fHCnz2RbBTDH77PqTacdb09wm7Le0knSqhGj
 01VOP7B9Zefv0kxiu9TjHqna4JzMB+ahI51/lB57HxPNW8NHpuEJ4NxM7/9OdX6O
 k6+KtTA7afXD5lvKVq5A==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t381vfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 21:45:13 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-31597cdcd3bso31953fac.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 14:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757540706; x=1758145506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=w/Demwy4FFKT7wLR0aTkZ0G5aRoHqReEtHzkVf/kk9M=;
 b=V+xGi/x17UxHWIDj/NLW4TFR8rSC9ES7lSKnnmGpdeJ7suwGcCYSJD7/yuExKormQZ
 egpwQpgIDFA3gEKZUG0jDRVqVWKtSlW+wYsIAkXrSYac6PNtUzxZBWruhivY30AQiX2C
 tFA5ycfXx3y6fJ3yVLKsUYBVCf14DW1Mrk2y7VmGx5cyst+bFPEZ7xjnaBLf7JxzaJF9
 +3a0DOmoRNKofGTI2M8RGSZDkxu/0Om8yB2PJJ6trXKmN05Ljri0g032XEgFtBRdeGbQ
 v+ZA58lvEFyLw79oHOq4YHg06DCs7+z1ku+NXOhiQEp9cDb1ut/buspPRk83KkFYlZn6
 waOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFUeR6wQo9Uj3SW1s7nuClZw6vsYQ0P6jXcZsixo9YtCLHLYYTSpplnfihDb+VSnHlLOjd+cGCLR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzNFYQEnTPIH+8U0LXsiIccHaPlIu1siBbjzWg/kFxfDogSGRAZ
 l5VMijVzgq3p/9NF90RYEEGzFokuJC0LBKberR8Hw7ZXYlVukeaRHgliOvtfSn3f5+gPq4AdEkf
 bkRuBCBwDwE3GvNJ6+ujE04N2C9kFjD+yqMLyJO03VPFZz96+MM3hGWx4Q39SWhaldBq3ti08qD
 1BSW3tTh3tciHiOiCwJssvJn2jBX803X4iK7VyaDmEbIoJoA==
X-Gm-Gg: ASbGncto42aGM1zNJw7pr9o0V7Qmzn7CWln7qQxMbpEvvk/RNIEBWPG/X614fKmZqK5
 3YtOvQSyXZpV3D3wDKfNJOX6dmgIVQEzx4VeZrDR61suuzA3nEG1uuDpuIr68DYqTI7qUFaLcnV
 l/aG9qM0PZVijtZg4FUi3/FVtUULDvMUUoTVzGOEUB3Zr3BOfKim1n
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id
 586e51a60fabf-32262a6d362mr7274768fac.3.1757540705901; 
 Wed, 10 Sep 2025 14:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVJ/g50t9kZW/ZaLe6GVeeuLBnWoaA7n3zqpoh6NbWQOdQF2WIKC87B32dbYHeYbUE2X9ZEP7MoGbxj7Ep8to=
X-Received: by 2002:a05:6870:9a1d:b0:321:2521:5a5 with SMTP id
 586e51a60fabf-32262a6d362mr7274754fac.3.1757540705293; Wed, 10 Sep 2025
 14:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
 <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
In-Reply-To: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 14:44:54 -0700
X-Gm-Features: Ac12FXwEpZ-r7IA8mOiamsbu_r09tIKNVWf2xHQxyoK9apW3k-0zqtWLdY5g9aw
Message-ID: <CACSVV02=+=PXtW-MrZVBKkFpadbMC_twKyRDPBb+YSJDX7dqTQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: mdTfuYHybUm0wZzcHxyBPCN4EJ9FZGTU
X-Proofpoint-GUID: mdTfuYHybUm0wZzcHxyBPCN4EJ9FZGTU
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68c1f169 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=mG2Gs39SVwW7J4BDEKgA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX8zcN7BhpYV76
 F0Yqjjr9f4cMFOKXv1Zo8fjrkuaInxuNY7GHsed1Web+SOmN+8mZ0Ll4vlXOFQ4lbyxL7byaefv
 nlwySshDctrBH/LYIA8s7rf8Qr/iyQUM/rnQPQvyQ6FOjkOe001pzFmfUDGrbi6MLI7HC3+5908
 L9qYv9Rwob2NFPms5Utnf8Pq+br5/M7+QD9syg/b8cLzkS98G36hFZjffSVSkHyZ8nVLKfqkysY
 JUSsfhkJnWBw0ZK4zrkpCUrXA6T2O1SteHMCOHdqx62Upv0eqdQC0HBIf3qqaZdJFEmiwaVRVPH
 w4dw3CbTVcUu7gk7xWoIN+Rxnoc8NBINFRCdOSNby3wlVzoDvD3F7JShWjwelKo+rEXnkJJaH5i
 ey5DMmIL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

On Wed, Sep 10, 2025 at 12:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> > On Tue, Sep 9, 2025 at 8:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > > Since these generated files are no longer checked in, either in mes=
a or
> > > > in the linux kernel, simplify things by dropping the verbose genera=
ted
> > > > comment.
> > > >
> > > > These were semi-nerf'd on the kernel side, in the name of build
> > > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > > registers: improve reproducibility"), but in a way that was semi-
> > > > kernel specific.  We can just reduce the divergence between kernel
> > > > and mesa by just dropping all of this.
> > > >
> > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +----------------=
----
> > > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/=
gpu/drm/msm/registers/gen_header.py
> > > > index a409404627c7..56273a810c1d 100644
> > > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > > @@ -444,9 +444,6 @@ class Parser(object):
> > > >               self.variants =3D set()
> > > >               self.file =3D []
> > > >               self.xml_files =3D []
> > > > -             self.copyright_year =3D None
> > > > -             self.authors =3D []
> > > > -             self.license =3D None
> > > >
> > > >       def error(self, message):
> > > >               parser, filename =3D self.stack[-1]
> > > > @@ -686,10 +683,6 @@ class Parser(object):
> > > >                       self.parse_field(attrs["name"], attrs)
> > > >               elif name =3D=3D "database":
> > > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > > -             elif name =3D=3D "copyright":
> > > > -                     self.copyright_year =3D attrs["year"]
> > > > -             elif name =3D=3D "author":
> > > > -                     self.authors.append(attrs["name"] + " <" + at=
trs["email"] + "> " + attrs["name"])
> > > >
> > > >       def end_element(self, name):
> > > >               if name =3D=3D "domain":
> > > > @@ -706,8 +699,6 @@ class Parser(object):
> > > >                       self.current_array =3D self.current_array.par=
ent
> > > >               elif name =3D=3D "enum":
> > > >                       self.current_enum =3D None
> > > > -             elif name =3D=3D "license":
> > > > -                     self.license =3D self.cdata
> > > >
> > > >       def character_data(self, data):
> > > >               self.cdata +=3D data
> > > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > > >
> > > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > > >
> > > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > > -
> > > > -This file was generated by the rules-ng-ng gen_header.py tool in t=
his git repository:
> > > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > > -
> > > > -The rules-ng-ng source files this header was generated from are:
> > > > -""")
> > > > -     maxlen =3D 0
> > > > -     for filepath in p.xml_files:
> > > > -             new_filepath =3D re.sub("^.+drivers","drivers",filepa=
th)
> > > > -             maxlen =3D max(maxlen, len(new_filepath))
> > > > -     for filepath in p.xml_files:
> > > > -             pad =3D " " * (maxlen - len(new_filepath))
> > > > -             filesize =3D str(os.path.getsize(filepath))
> > > > -             filesize =3D " " * (7 - len(filesize)) + filesize
> > > > -             filetime =3D time.ctime(os.path.getmtime(filepath))
> > > > -             print("- " + new_filepath + pad + " (" + filesize + "=
 bytes, from <stripped>)")
> > > > -     if p.copyright_year:
> > > > -             current_year =3D str(datetime.date.today().year)
> > > > -             print()
> > > > -             print("Copyright (C) %s-%s by the following authors:"=
 % (p.copyright_year, current_year))
> > > > -             for author in p.authors:
> > > > -                     print("- " + author)
> > > > -     if p.license:
> > > > -             print(p.license)
> > >
> > > IANAL, but I as the generated files contain C/C++ functions, I think =
we
> > > need to have a corresponding licence in the file.
> >
> > I can't find anything that indicates a difference depending on the
> > contents of the generated file (ie. whether it be
> > functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> > license of the generated file is inherited from the input to the
> > generator.
> >
> > Some other points:
> > - the various *.mod.c files generated for each kernel module do not
> > contain a license
> > - various files generated by asn1_compiler do not contain a license
> > - other generated .c/.h files are a mixed bag, some contain a license
> > header and some do not
> >
> > (In all of the cases the generated files should not be distributed,
> > IMHO.  Yocto should fix this.)
>
> It's a bit funny. Normally you use something like linux-headers-foo,
> which contains just include/*, arch/foo/include/ and some other files.
> Yocto has adopted a way of building the modules against a full-kernel
> source & binaries dirs. As such, those two directories are parts of the
> cache aka 'shared state', which gets shared, etc.

So _all_ generated files get shared?  Is this about building
out-of-tree modules?  (Which even in that case, they shouldn't need
these generated files.)

BR,
-R

> >
> > BR,
> > -R
> >
> > >
> > > > -     print("*/")
> > > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > > >
> > > >       print()
> > > >       print("#ifdef __KERNEL__")
> > > > --
> > > > 2.51.0
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry
