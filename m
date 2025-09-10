Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1EB52459
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 01:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA8F10E19E;
	Wed, 10 Sep 2025 23:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EF0GJc53";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7082610E19E
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 23:00:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AMAI7G023761
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 23:00:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 914LeQkfu91jt/QVv1f92X+tdyI3Azz2Mw7FuL1awk4=; b=EF0GJc53cljJtvMe
 R2BH6enz+nyMqRYvbksIFcSwujVTVOzDla/rFJi4opnSJwOxmSbHbxti4ss4hbcp
 bKbhToYFuRsdHcf5KYFuxej/iyupeqsf3liI+1aCE4lzPppGb6rC0+jdvlfkAW+n
 MgS6LMSSwKQhbJqx1YMYXcCwdK0gbKv+O0ljOlsrgG5XcxVSpaK/RtKeYEjP2pWL
 pQUbxOxxHsYyiZCvd6UjK+FHFhNEzuDWbO5jDtfYeutzIPR2DqPBQ2AveBU7oZT4
 jmlN0081RK1pO1fLLwJ2qrWRG/cGOGjHnFOf/mjR+RsJuaiOe6ZVs8eTRDxyER7N
 2neTgw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m5eq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 23:00:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70edbfb260fso2124206d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 16:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757545236; x=1758150036;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=914LeQkfu91jt/QVv1f92X+tdyI3Azz2Mw7FuL1awk4=;
 b=nbcuZXIcJRgS22MCx3WHfOO5N+2jOdjaDjGDvj91+1DcDMuGTZRgihYSoqoBiKroKz
 yBkdJR907jOR//Mu6wJ6Zf5lt+9anBWwo3y3tK57ih0rB5kQX6IXD/hoHQC1Yyp8QM7d
 zjaQDoxleLPrrj24OpTkexWZmQVjHFYzwe46jSc33HPGJk1usdlujiQRUn0BWLpOQtyj
 MXcqTDsQjfk1TtR4Moz5RmgHz6XFwq0BNlEx6KJ9cAbhOnDusFSix6yaJXVRkuALmJ2H
 +u7XGHUlZtc44K0v8ZC8XyCEVcMWpvZEOzsUBnU+MUq4NLOPakqcqb5Fk2RmUhL7ZyCe
 bhPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmSCEJUYMMT1N/teJfQmXflQ75mibAVYgZudQBxZhGFXZhdyrClIBZoUmY4NEqlBQClpYnu33wz0M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNVCA/6zCKu4pXKxnO5kCOGI+DzKygftA9+Ii/23vJNjMtVNPJ
 B4JvnGsRI1Cawlaq6Q0hXL1IeLzRYEP/TiV1/gQdQnuGjPhu5llfVa8uA+khvVBQNStvl0D0/QH
 zmOEnwyTw7v4SbEpIs1tycKHmXHPvhCdkll694YxWkuEJIrkd+njS+ADoL7NKRppdNR+ffZE=
X-Gm-Gg: ASbGncuMpc050Mlcd9V1ZQbHdIwM5O89I6XKhv/qwf9v1u7ZeVP7Rqy176LvXNYdM3z
 tWGxz3rrgyyDSpTllRLPmXFXDzqIaKdo9/KazGD2JoOy99Vbr7XySFusPbzvY0ZFRSEO5/w8O9D
 rw6rwODBPSx02gbcKk9vw9lGcozFuRoaSL/QbnkcmjoEoXXXXSgY+DDugoQ96q95Og594JGvUq7
 laTN3MH/lTmRo9E2P2IbRF0hcQaGfqVKNIpW1lQV1aAEKd4qdOhIxyMIYiIONsRiDFxJeT2Z4aM
 lj4ZIzWcrj9XGFwENpLzpKDujAyCMAft77EFP7sxTuK3dbcHp9KT9Vgxm0Hyvw2pcjujiY3rE+L
 hnpqb9GAm+uL7fo9Kv7wEy2VgATlbwN86wZLVjHl1DwyMrJLk6sWk
X-Received: by 2002:ad4:4eea:0:b0:726:32d9:db53 with SMTP id
 6a1803df08f44-739435ce873mr188465406d6.59.1757545235736; 
 Wed, 10 Sep 2025 16:00:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTuLLuSD/z2qmLIK+/TJNlWplJfbykOm3sp1ZCoFT1OChV63M7ij3BfD+2/tdI+tmyoqG+rA==
X-Received: by 2002:ad4:4eea:0:b0:726:32d9:db53 with SMTP id
 6a1803df08f44-739435ce873mr188464496d6.59.1757545234954; 
 Wed, 10 Sep 2025 16:00:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e1d9e2919sm54322e87.9.2025.09.10.16.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 16:00:34 -0700 (PDT)
Date: Thu, 11 Sep 2025 02:00:31 +0300
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
Message-ID: <vuuvxw6dehbaxicrrirhfiyvic4ybts74gt6grtcrx42yhpm6w@n4xfc3iy42lf>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
 <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
 <CACSVV02Zym2hC-fFcJsP4M9T4mYGXsMtGrmnux6Eva0C7PHdfA@mail.gmail.com>
 <sydyej7hrw6tryx5lnidqucx3bcw34dkinj5c2u6szbv2wgnuo@utrlq5q5pt6n>
 <CACSVV02=+=PXtW-MrZVBKkFpadbMC_twKyRDPBb+YSJDX7dqTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02=+=PXtW-MrZVBKkFpadbMC_twKyRDPBb+YSJDX7dqTQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXzYC4HWnq4agL
 pPD4YlZ5eOaIOcbo4s4nw08/OyquEIr/V10S6qwq5/HETWcNE75QLrb4ENBFGuyMc+3xLp6WLhY
 4/64NCpVGuEgO1WI3dAC81azh+fCVEUhEztGYn7d6SeCRiucaCn6rng5ZRDNUp2zIBxfhLw8jVz
 WqpP5D0tISQ9agsNg3vT2IhbJID3kj/GW1G8xBzXIyj+PkEC5PprhQxrlAixyW2cSwqaRtsOExB
 5oqlwGZx/ggpIsWVOcq0fNz7UpeVKDnU06f1DPe/cWYAHVGxspTfAj7wKsIqk47M66xxO42HDBS
 GXUwfvmXVLD1LN4GTlNzX96yUiUalhffLaxXx528+rUd9TL/h2SqvlQyvSf/7/vUYe5x/rrEQgE
 2N3JmCsp
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c20315 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=kcwbHBCksZcoAycTYWwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: Ps2MH1aB_QWkjOivMjSpyAje3tkQeQSH
X-Proofpoint-ORIG-GUID: Ps2MH1aB_QWkjOivMjSpyAje3tkQeQSH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Wed, Sep 10, 2025 at 02:44:54PM -0700, Rob Clark wrote:
> On Wed, Sep 10, 2025 at 12:38 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Sep 09, 2025 at 10:25:52AM -0700, Rob Clark wrote:
> > > On Tue, Sep 9, 2025 at 8:01 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >
> > > > On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> > > > > Since these generated files are no longer checked in, either in mesa or
> > > > > in the linux kernel, simplify things by dropping the verbose generated
> > > > > comment.
> > > > >
> > > > > These were semi-nerf'd on the kernel side, in the name of build
> > > > > reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> > > > > registers: improve reproducibility"), but in a way that was semi-
> > > > > kernel specific.  We can just reduce the divergence between kernel
> > > > > and mesa by just dropping all of this.
> > > > >
> > > > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
> > > > >  1 file changed, 1 insertion(+), 36 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> > > > > index a409404627c7..56273a810c1d 100644
> > > > > --- a/drivers/gpu/drm/msm/registers/gen_header.py
> > > > > +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> > > > > @@ -444,9 +444,6 @@ class Parser(object):
> > > > >               self.variants = set()
> > > > >               self.file = []
> > > > >               self.xml_files = []
> > > > > -             self.copyright_year = None
> > > > > -             self.authors = []
> > > > > -             self.license = None
> > > > >
> > > > >       def error(self, message):
> > > > >               parser, filename = self.stack[-1]
> > > > > @@ -686,10 +683,6 @@ class Parser(object):
> > > > >                       self.parse_field(attrs["name"], attrs)
> > > > >               elif name == "database":
> > > > >                       self.do_validate(attrs["xsi:schemaLocation"])
> > > > > -             elif name == "copyright":
> > > > > -                     self.copyright_year = attrs["year"]
> > > > > -             elif name == "author":
> > > > > -                     self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
> > > > >
> > > > >       def end_element(self, name):
> > > > >               if name == "domain":
> > > > > @@ -706,8 +699,6 @@ class Parser(object):
> > > > >                       self.current_array = self.current_array.parent
> > > > >               elif name == "enum":
> > > > >                       self.current_enum = None
> > > > > -             elif name == "license":
> > > > > -                     self.license = self.cdata
> > > > >
> > > > >       def character_data(self, data):
> > > > >               self.cdata += data
> > > > > @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
> > > > >
> > > > >       print("#ifndef %s\n#define %s\n" % (guard, guard))
> > > > >
> > > > > -     print("""/* Autogenerated file, DO NOT EDIT manually!
> > > > > -
> > > > > -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> > > > > -http://gitlab.freedesktop.org/mesa/mesa/
> > > > > -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> > > > > -
> > > > > -The rules-ng-ng source files this header was generated from are:
> > > > > -""")
> > > > > -     maxlen = 0
> > > > > -     for filepath in p.xml_files:
> > > > > -             new_filepath = re.sub("^.+drivers","drivers",filepath)
> > > > > -             maxlen = max(maxlen, len(new_filepath))
> > > > > -     for filepath in p.xml_files:
> > > > > -             pad = " " * (maxlen - len(new_filepath))
> > > > > -             filesize = str(os.path.getsize(filepath))
> > > > > -             filesize = " " * (7 - len(filesize)) + filesize
> > > > > -             filetime = time.ctime(os.path.getmtime(filepath))
> > > > > -             print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> > > > > -     if p.copyright_year:
> > > > > -             current_year = str(datetime.date.today().year)
> > > > > -             print()
> > > > > -             print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> > > > > -             for author in p.authors:
> > > > > -                     print("- " + author)
> > > > > -     if p.license:
> > > > > -             print(p.license)
> > > >
> > > > IANAL, but I as the generated files contain C/C++ functions, I think we
> > > > need to have a corresponding licence in the file.
> > >
> > > I can't find anything that indicates a difference depending on the
> > > contents of the generated file (ie. whether it be
> > > functions/tables/prototypes/etc).  And AFAICT it is implicit that the
> > > license of the generated file is inherited from the input to the
> > > generator.
> > >
> > > Some other points:
> > > - the various *.mod.c files generated for each kernel module do not
> > > contain a license
> > > - various files generated by asn1_compiler do not contain a license
> > > - other generated .c/.h files are a mixed bag, some contain a license
> > > header and some do not
> > >
> > > (In all of the cases the generated files should not be distributed,
> > > IMHO.  Yocto should fix this.)
> >
> > It's a bit funny. Normally you use something like linux-headers-foo,
> > which contains just include/*, arch/foo/include/ and some other files.
> > Yocto has adopted a way of building the modules against a full-kernel
> > source & binaries dirs. As such, those two directories are parts of the
> > cache aka 'shared state', which gets shared, etc.
> 
> So _all_ generated files get shared?  Is this about building
> out-of-tree modules?  (Which even in that case, they shouldn't need
> these generated files.)

Yes. 

-- 
With best wishes
Dmitry
