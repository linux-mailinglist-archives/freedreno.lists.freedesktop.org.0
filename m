Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2CB5007B
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 17:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E0110E762;
	Tue,  9 Sep 2025 15:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ujc/zzZD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4CA10E762
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 15:00:57 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LkGk020449
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 15:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XqTohBj1qLgWoq9uplvti4/t
 OBT3VUOGqeH3HMHa23Q=; b=Ujc/zzZDfrz66ycCfRDwoKgyozPtCQtDLcQUJy7h
 GpeY6fTqjvPJo3xF2Q1/l9j88dxXLHsirSC1imZ1REETNpdB3FRYkgtckOPoJn6N
 edK04EejMtI64A+tZE5+DHp6PmcgXP7Xeo4/tRtX6dpVuSQx8Tzn1qdBOxO+a1F0
 h3VyMlyqnBljcgisvUlEmP+d90KXSex9RkxWaEsrhNyPBtXhTQwrHFpdiTmyRAhY
 4cTYJIqnsh1P0ZxJwsxztPm10FE4eEPaBdMoYyeXy0n3xoMF1mTQpGdWDZwuBiB2
 08ah60erE2GtkElTqkt2dQ9nAzLNEgBdp3V4b3SrIOGQaA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc24mjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 15:00:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso124013166d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430056; x=1758034856;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqTohBj1qLgWoq9uplvti4/tOBT3VUOGqeH3HMHa23Q=;
 b=w88LA6Cr1VZLK+6alArqpAeRWeKkSjqAAq4PlZKj2tJLcP3orDSiKGBkBcu5MosS+s
 9xF73WwNe2ggYCo/cceKsjF4I5aF/q0W+36VjJDhdHMwByT8Zr7nvIwEqsepI5BJeRWj
 zADLJbX63jtJnVccbSwt6yu0g+bEjwfkdREx7D7ZnWbDf4tUeT/5IE254OL5qZiKR8ea
 S8OTdHK37CLHs/q5ob2MaARhCsXy3rZfwbhyrIiiTBLALfSrfBhOly2Ur4Ym808joyYH
 YXMJUvf9gU7TivDqEDVB82ozFIw2R0FvbS7q+CEfkE3xiaIhmbwpzDr6TUYQ1jrduO7C
 DHrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX57mmOwsjtdZDf3Lll/lJnYc2y4DdH4un4nSSQ9IMi7ZTkfYdSFIn2jOETf7GeMkKKUx6Q/5MmjsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKKHGX6BV6yWde7VOjTHh82KphOHbWjDaNZXAujj8OJ2QVF7UC
 +ski6aTIl0VDIIdOQg5pq0wkVXS7GnrEXjUwkjUaIqh/6SRp0PJ1dVWlHqNjUkcRTzUryWgqwTt
 PMYlGAIKRpHCIk6FGDLfDSUz8Eqs7JHXHoUHGlXi8sT7FSqixsr0qnKDA8Tj9q9v/zfYL5Iw=
X-Gm-Gg: ASbGncsB4IAMFJzgoZCEKFj7ZXJh9h3CKmjq+Oo40RcQABPxCT7hTstp/Q2KIsfwaMk
 XIsBP7/MaJjPTLYC3YA/BaE4FPH+Js1/lR+ZKBwV61h303maNuXNOU4QGqtjRz+287GUdoPQJP9
 tpVsJmpXwepzd5nP0lZ2182QDUPj9xKBmuog2qLTdTy05Gw9XOnQcNN0E25XbfARlJNZeI1zzjC
 uqc0A+qRJqSLyl02zGK7BhlfndJH38GviExaBdmMntTmiu+oV5+ua6O/rYHd9e2YHpzh3qNsk5Y
 wIPaOKprEZUtRw4E8c7ObTwmQjMzqyGr78sukGvsbKCc3UL5s2WcSsgJpBr5GPty/IbFvuH4Ifr
 Te00ylJByU98hkG8mhtd6VTjLC1o1HtGm6+JdfAU6vi2kyl4JSWMw
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id
 6a1803df08f44-73924e25c29mr143249726d6.19.1757430049182; 
 Tue, 09 Sep 2025 08:00:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFtK5sa4xm8mOsPdJfOo7fiBsFLFw85/oBAA2VqPWFp39gtDPu1XOXGBLAKw5O4Aqb0iu2zQ==
X-Received: by 2002:a05:6214:528f:b0:70e:86:af36 with SMTP id
 6a1803df08f44-73924e25c29mr143238896d6.19.1757430041379; 
 Tue, 09 Sep 2025 08:00:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d3662sm39087341fa.69.2025.09.09.08.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:00:40 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:00:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
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
Message-ID: <o25axq4soxjluqnxjad2f3blhezuglsvex6k3aav5v65ynn7qd@5i3wm2lryr7q>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-2-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68c04128 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=q_i8wjiaOVoz8fm2smAA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 0krmMGbudw0nLlfQ_hFoTx6NonDEfxin
X-Proofpoint-GUID: 0krmMGbudw0nLlfQ_hFoTx6NonDEfxin
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX25NHDtooOvRE
 vVqVmAbyLs3PjYJDZHKf+j9NiwalSIjkLEmPDyZzgxywZyJNkn4lE8Ly4V2Dk/09N3p4AZ+ug7A
 NMi6BOuL9c0PKReTcUVekVu35EFd5dIo3dJGBzKi4yQ9+dCElIYKdnWbFvjX+8OEAnVa4614gvx
 22loc5oDP4e6tOd+CMi7IQ7DFfZcpHQ89ldCTkEDCXxIo3XRF9XXJG0R/2mt66usgTKMReSya1W
 xQwlDjRHYTLf0K6oi5nIVod1cuJPov0aV77+slv3nB8KakidibBF8jtxiMFGiWAVsdyUazfFsad
 8ZKcnGUjjlwCE1iRk0vWJR2dn2d7hctsEMOQA+0UXgO+GaDv61YLmVpMY7lRQug0YYzhCbtwrvk
 tqe0xFgq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Mon, Sep 08, 2025 at 12:30:04PM -0700, Rob Clark wrote:
> Since these generated files are no longer checked in, either in mesa or
> in the linux kernel, simplify things by dropping the verbose generated
> comment.
> 
> These were semi-nerf'd on the kernel side, in the name of build
> reproducibility, by commit ba64c6737f86 ("drivers: gpu: drm: msm:
> registers: improve reproducibility"), but in a way that was semi-
> kernel specific.  We can just reduce the divergence between kernel
> and mesa by just dropping all of this.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 37 +--------------------
>  1 file changed, 1 insertion(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
> index a409404627c7..56273a810c1d 100644
> --- a/drivers/gpu/drm/msm/registers/gen_header.py
> +++ b/drivers/gpu/drm/msm/registers/gen_header.py
> @@ -444,9 +444,6 @@ class Parser(object):
>  		self.variants = set()
>  		self.file = []
>  		self.xml_files = []
> -		self.copyright_year = None
> -		self.authors = []
> -		self.license = None
>  
>  	def error(self, message):
>  		parser, filename = self.stack[-1]
> @@ -686,10 +683,6 @@ class Parser(object):
>  			self.parse_field(attrs["name"], attrs)
>  		elif name == "database":
>  			self.do_validate(attrs["xsi:schemaLocation"])
> -		elif name == "copyright":
> -			self.copyright_year = attrs["year"]
> -		elif name == "author":
> -			self.authors.append(attrs["name"] + " <" + attrs["email"] + "> " + attrs["name"])
>  
>  	def end_element(self, name):
>  		if name == "domain":
> @@ -706,8 +699,6 @@ class Parser(object):
>  			self.current_array = self.current_array.parent
>  		elif name == "enum":
>  			self.current_enum = None
> -		elif name == "license":
> -			self.license = self.cdata
>  
>  	def character_data(self, data):
>  		self.cdata += data
> @@ -868,33 +859,7 @@ def dump_c(args, guard, func):
>  
>  	print("#ifndef %s\n#define %s\n" % (guard, guard))
>  
> -	print("""/* Autogenerated file, DO NOT EDIT manually!
> -
> -This file was generated by the rules-ng-ng gen_header.py tool in this git repository:
> -http://gitlab.freedesktop.org/mesa/mesa/
> -git clone https://gitlab.freedesktop.org/mesa/mesa.git
> -
> -The rules-ng-ng source files this header was generated from are:
> -""")
> -	maxlen = 0
> -	for filepath in p.xml_files:
> -		new_filepath = re.sub("^.+drivers","drivers",filepath)
> -		maxlen = max(maxlen, len(new_filepath))
> -	for filepath in p.xml_files:
> -		pad = " " * (maxlen - len(new_filepath))
> -		filesize = str(os.path.getsize(filepath))
> -		filesize = " " * (7 - len(filesize)) + filesize
> -		filetime = time.ctime(os.path.getmtime(filepath))
> -		print("- " + new_filepath + pad + " (" + filesize + " bytes, from <stripped>)")
> -	if p.copyright_year:
> -		current_year = str(datetime.date.today().year)
> -		print()
> -		print("Copyright (C) %s-%s by the following authors:" % (p.copyright_year, current_year))
> -		for author in p.authors:
> -			print("- " + author)
> -	if p.license:
> -		print(p.license)

IANAL, but I as the generated files contain C/C++ functions, I think we
need to have a corresponding licence in the file.

> -	print("*/")
> +	print("/* Autogenerated file, DO NOT EDIT manually! */")
>  
>  	print()
>  	print("#ifdef __KERNEL__")
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
