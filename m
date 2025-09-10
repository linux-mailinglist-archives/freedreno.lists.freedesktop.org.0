Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 601B7B5213E
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 21:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EDD010E9C6;
	Wed, 10 Sep 2025 19:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM3u2X4J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EFB10E9C6
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgSkO021329
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=; b=dM3u2X4JFtWXF7rv
 MxD7iONV/6g1+O2+D9GH62cQBPHvbJszqQ/c/t2uE00YpIAhmqR/QCb4s91xx8Ya
 mJYNvf1V/UqLe/PeOMabk1/plkG9ybw7mXDWXyBzjfGTo+nf4B+PgTOjDZyvj6Vb
 Ug1eGTtrk1Z3uTclAcnepofloqRIpyRqcI5PY5Nclk3rYfsYvzTynvFCxnAmY2dA
 nL8ZiVBwibruBKR4q0YUVFKQr6VBZgMQr8VyQFBOLNymeAV01vmbeFOP+IZFEI3r
 4Ag91Nhde/+nhBEF7FeKOcih6gfybr+D5v2NEZMdkH4xboBJbZb4ehO7s7WmvPBF
 eCuTtQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by953f5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 19:38:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b60dd9634dso1907901cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 12:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757533127; x=1758137927;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQu1oB27eIlAjTTYbUEVNBhRjkuYrUPFp5Bg13JvYK0=;
 b=npyA4eyrGT1Xx6zB7P16gE3UMkPzqz5/MGOLC0hqOrgI995eNp+4UgcuS1LBF9GD4A
 puJj5NyzWBD6V5z3RXJONsy+b5q3qfvB99myuiYS7WjZAxt/Ya0dJelsBLZZqMXFNEA1
 zeZtPieXvY8ujCdURqnDweeuN+YgGw1qYbYDgcpgVeO7Ms1LtQCtmBJxNppadXSB3TAT
 7AuENSSzHdVM5gRxNm/x0EeBNw1eJOLvkcM30GJoMD5RFObSeoWWxEahiM0YekDm7ejp
 BgUwMIL6c+pBuxFaXTGkdcjQ2O4yTuKpE3Z7D3z5lEmLduoqpJHkwX4vjB3QhrR2v/dV
 8k/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLfLNo592x8IEMWY4WQQiL0xwLjzkBDtLA6Tn93l5LhsUcKPlE+FJuxs5cIY7qqTavW6XZvrQWCLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3qDCDM7vpBXSDSC85UCDcsqR+7N47aVK0lJ0gEzQYN0MJApH1
 RRt/gqckyF0iuIcsmhBP9p9hb9SVHxfV73WJgKSaueyOqEl98t8OMSJi1FsLtan8YnsMdg+PGbE
 ZZqJkNoSUJcVix1sEDC/e90AYJ8yclJsD+twlY9x16SMuPQh3dyCgWBWgaNcmwo39dVZBXgo=
X-Gm-Gg: ASbGncsDnpujKG9SSiKWyEgRKxjyzqis/KmHwSpDOlCRLZEFV7awIDEgxS8wM1y/RUH
 u+rcpy4rSME0/AL8P3WsoAntvds2Rx9nW+hRbEk2yltrJ9hgsNqmi/jLDMrSn1XRV/S7YS0f8SW
 YLr2dJ7mjHnlKL2970wq6Hq7qRQbBIRolKrXNjMCOzqBR2nrRr4vS1+CoVVrKvvFPrZR56DopIc
 5Mnkj3HwA2qor1Q4acQRBxJnei2h9SA5vZ/936xtSL6ParjvHKHqcE1Jq/k0QrwL/XpAadCEm7j
 LU9WuIiy4xdr+TgSD1kR62Nb3GEmkmQIBOB7/Yar5iun2IGV0j+jCsFnQ5P3XfhteeJBELbzGRJ
 ZVDBFtprHLRdFPTfnG/QimcYFcr8repXjL2pQdp3oKsTICb5ppVF9
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id
 d75a77b69052e-4b5f846aecfmr191472361cf.60.1757533126886; 
 Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWpzldX+nVaSSGFt/xXRLMND2ntg53y340LE916xuyEMHMVjbyw6ovDoruvOslzFHp0wFBkQ==
X-Received: by 2002:a05:622a:1115:b0:4b3:a2f6:d5e7 with SMTP id
 d75a77b69052e-4b5f846aecfmr191471741cf.60.1757533126191; 
 Wed, 10 Sep 2025 12:38:46 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db89110c4sm53690e87.5.2025.09.10.12.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 12:38:45 -0700 (PDT)
Date: Wed, 10 Sep 2025 22:38:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/5] drm/msm/registers: Remove license/etc from generated
 headers
Message-ID: <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68c1d3c7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UhSop3MGIIBhUl3aXewA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: vgENcxHWsB6I1lEEG9-SXvhjufyC5lEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX3o79XuW0zO7P
 AG2uR2s/++vPI1Mq5yrNvfe63HlOB7sshtFjxSmpCJVMOZgJ/j+ErgVq+6fZ/ERg8oMrmOUGc07
 WOT3DHk4P5WD5B3/cjUDOPykflrBFaHlVnRRrTSlioAXuqRdrIbBvZRSUVGrfIOIRZr3pKUJGOq
 7kKS0PjdgZOhtUjCNOPS3neXZFTUY14uyGieF6M7XQ3dmH7JgmF45Rqs7KQQ6YNVeUTwEdbMnlJ
 7BQ+HRXGSM3uU5kpfrG5Rr1GOgeEuFTDjCtzk4lcQhZLq6PsOFylDxRexQMcYFxz59SV4ScnSoN
 OvxBTstKJ8mHHzbF45VxuDxS+H5Jb45Sn870NtVE5t1m1LoqClOm49L6iADN6pc3XmlkKnEs05T
 IQmwmi6z
X-Proofpoint-ORIG-GUID: vgENcxHWsB6I1lEEG9-SXvhjufyC5lEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> On Tue, Sep 9, 2025 at 8:01 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > Since these generated files are no longer checked in, either in mesa or
> > > in the linux kernel, simplify things by dropping the verbose generated
> > > comment.
> > >
> > > These were semi-nerf'd on the kernel side, in the name of build
> > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > registers: improve reproducibility"), but in a way that was semi-
> > > kernel specific.  We can just reduce the divergence between kernel
> > > and mesa by just dropping all of this.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > > index a409404627c7..56273a810c1d 100644
> > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > @@ -444,9 +444,6 @@ class Parser(object):
> > >               self.variants = set()
> > >               self.file = []
> > >               self.xml_files = []
> > > -             self.copyright_year = None
> > > -             self.authors = []
> > > -             self.license = None
> > >
> > >       def error(self, message):
> > >               parser, filename = self.stack[-1]
> > > @@ -686,10 +683,6 @@ class Parser(object):
> > >                       self.parse_field(attrs["name"], attrs)
> > >               elif name == "database":
> > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > -             elif name == "copyright":
> > > -                     self.copyright_year = attrs["year"]
> > > -             elif name == "author":
> > > -                     self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
> > >
> > >       def end_element(self, name):
> > >               if name == "domain":
> > > @@ -706,8 +699,6 @@ class Parser(object):
> > >                       self.current_array = self.current_array.parent
> > >               elif name == "enum":
> > >                       self.current_enum = None
> > > -             elif name == "license":
> > > -                     self.license = self.cdata
> > >
> > >       def character_data(self, data):
> > >               self.cdata += data
> > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > >
> > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > >
> > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > -
> > > -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > -
> > > -The rules-ng-ng source files this header was generated from are:
> > > -""")
> > > -     maxlen = 0
> > > -     for filepath in p.xml_files:
> > > -             new_filepath = re.sub("^.+drivers","drivers",filepath)
> > > -             maxlen = max(maxlen, len(new_filepath))
> > > -     for filepath in p.xml_files:
> > > -             pad = " " * (maxlen - len(new_filepath))
> > > -             filesize = str(os.path.getsize(filepath))
> > > -             filesize = " " * (7 - len(filesize)) + filesize
> > > -             filetime = time.ctime(os.path.getmtime(filepath))
> > > -             print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> > > -     if p.copyright_year:
> > > -             current_year = str(datetime.date.today().year)
> > > -             print()
> > > -             print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> > > -             for author in p.authors:
> > > -                     print("- " + author)
> > > -     if p.license:
> > > -             print(p.license)
> >
> > IANAL, but I as the generated files contain C/C++ functions, I think we
> > need to have a corresponding licence in the file.
> 
> I can't find anything that indicates a difference depending on the
> contents of the generated file (ie. whether it be
> functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> license of the generated file is inherited from the input to the
> generator.
> 
> Some other points:
> - the various *.mod.c files generated for each kernel module do not
> contain a license
> - various files generated by asn1_compiler do not contain a license
> - other generated .c/.h files are a mixed bag, some contain a license
> header and some do not
> 
> (In all of the cases the generated files should not be distributed,
> IMHO.  Yocto should fix this.)

It's a bit funny. Normally you use something like linux-headers-foo,
which contains just include/*, arch/foo/include/ and some other files.
Yocto has adopted a way of building the modules against a full-kernel
source & binaries dirs. As such, those two directories are parts of the
cache aka 'shared state', which gets shared, etc.

> 
> BR,
> -R
> 
> >
> > > -     print("*/")
> > > +     print("/* Autogenerated file, DO NOT EDIT manually! */")
> > >
> > >       print()
> > >       print("#ifdef __KERNEL__")
> > > --
> > > 2.51.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
