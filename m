Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fwSPL129fWnmTQIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 31 Jan 2026 09:29:17 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 058BAC13ED
	for <lists+freedreno@lfdr.de>; Sat, 31 Jan 2026 09:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82D589358;
	Sat, 31 Jan 2026 08:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="StpbvoES";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUftEZIc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF7810E159
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60V4U8oJ448134
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ZITwdl9I10OiomQXEmP80yCl
 NexlI/AvP0dRW5FYPdg=; b=StpbvoES2qaMAgvDikkVsrVr4wgdbRinu/yuYXzM
 7loqLLTvdnFNtHVYHrCKuhg3wzp7Gxex1ynKacv1v+kADCvt3mAajJQQ2SyUPdzD
 CvTMMZa5ESOi+FRWRPAIrhCWHU/oT1e77LQagIjj/pok+R7Tr444CsePBE52Kqxg
 HDwsaLnGDYE6xfCuQ4NUX0pxEQK7eObJS9ZDE6FAuNIEl77Sl3O+yP5lSU68kZjG
 ZOddf1pne7u+0+nz7yxpotL8gbmwZoPCH3u2Fl8X+lZ7MQnL0Vl8yXVYDoLkxpzx
 uAcHFBSmui7q+Sye31dCCXh4j6PWn7vsLOwGhHaVPqBO2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1as0rg6x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 08:29:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-502a341e0e3so80859721cf.3
 for <freedreno@lists.freedesktop.org>; Sat, 31 Jan 2026 00:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769848153; x=1770452953;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
 b=cUftEZIcdqXibs87uzxqojBPzu18QkUKiObTIA5TiRQakdQ4LOOysJ+caFSDBXDzvU
 gw/GTWyTqexojbtvfRclIZg6Yej3GvcfBIOZ7L583zr0aeqARXOCeM2k6Drls0bIN8hQ
 kxP41y2kVO92fWfoBtM1EQ9e1RNAJ8qdqn8e2FNPe0FY9CWSm2UFkstqVKlF/sHUZKHA
 VU6L+aqxZ2xLblI+2HhlCQthHObt/BioeP28OVXZU4KIue2W1fUwYEY9Y/ReYw0cmLf6
 pQHd3/EnpctJ8OrwE7L8I9D+t10J9TaPSBK9/lxYOWiXaHoISfk/Wd7x0BY9VIaYbH9q
 w3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769848153; x=1770452953;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZITwdl9I10OiomQXEmP80yClNexlI/AvP0dRW5FYPdg=;
 b=xQ7cPFKy4XwToh0gdBqbFD+FOpBedJAjf55GKGNoHEoaF3aV9HLn+11epyGETzEPZh
 0FLR7ctzIjm9qZbjptN9kmUdezHIPxNd4NNQDEV11SGXii5Aua16wJc44nP0rV8zPx/2
 7LDMJ4W7DST4pxesm4XWQ4fhE5NmOZiXtZuYfhsrP51t235xtN9gbNvIUmVhqmBll99U
 LVlcnIrsN++6WQGAdI24wZw6FKvFKNL1s4Jv4z2ZH38xh108p2kHhBqpe8Sqk4CmNMs1
 XJTjdImFvQ/AoTd8ONrvoxnY6G4eUMm2qm1DdTjan8bD0kHAWzekPXK/Gf1dGR34dC0H
 Pq3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJOj50xlpC2Xsn9cRbgFYgNnhrX2U2C3qtYZL/IwbHsTCOJKdUE4mmx2m89ikbPWoWfmdEwdYlUDg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzM/PWvNjYmn//tcHkBc3CY0XcgphV4QfyfAL+nizhWeQvuxgEK
 Nmyn4PYcsYR2VWmvb+lknGsvZrSeCF84yAEdAX9RXBGFkPxGFsQ8b+1RVhoc9TSowveut1eNugy
 X0HfIUqfBX/STy3JmBIiBAe23RTVdvMf3OSWcYFPv20Ly1gJbpIPhKFQTNXWdCwKZQfCX1BI=
X-Gm-Gg: AZuq6aJJJFsHefL7yIL98GDaCszQBs88nFeZ44NHYNu43miuvqjBnqtK7kp9zhSVj5q
 9z64AglAkGFn125Md92w02hPH77D80tQ9eNZC9pFn96j51xaU2x6FlXxv1WvfNxIdo0dgis27CU
 GihBmYhCUzSwHuABJMdOqbm1oAESs29qoh3nrd8qNhSFW/fxVjxexKoKtyCxC2RR0SJX9mZ/FgO
 cwk3WZFMpn5EtG+m4sQgqeRlbCwkDezkm9iQx0FDTNSgQYretFCokFsPqhByivKPdwJ4LVtfpEG
 3saLmztAX+hTTUk/y9JGUERODsdJ5eJvZO49HdEuvDBRBjRhuCgl+4BruL/jyT+OYqNa7TkGNT3
 TBbmrBUmUoMlURziwBV+0ooZRE9t46mN/mSu4mzgf5vRzbuzvyb6556K+5Z4EXmePUwc0GdpBRV
 on8AaH+UANMa+VEXaGbf+j/fE=
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id
 af79cd13be357-8c9eb216411mr644980085a.14.1769848152895; 
 Sat, 31 Jan 2026 00:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8c9:ea1c:f216 with SMTP id
 af79cd13be357-8c9eb216411mr644978485a.14.1769848152398; 
 Sat, 31 Jan 2026 00:29:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38625fce627sm17225751fa.48.2026.01.31.00.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jan 2026 00:29:11 -0800 (PST)
Date: Sat, 31 Jan 2026 10:29:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sunliming <sunliming@linux.dev>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, airlied@gmail.com, simona@ffwll.ch, sean@poorly.run,
 marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sunliming <sunliming@kylinos.cn>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <wcbaoiswckhbm4rzbu26ueccdh4jzahc5sictyuqrxfknc5ge7@va2gbq2jiyes>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2OSBTYWx0ZWRfX4I8YDJDch84G
 180zZbtWPTevlQEiguHq8UO6WQ0JZnkckeyGvjOx+2/4XcacBvzFqLlnXHTaP78eHChKlirIDtl
 hTBwhbpsWWFEMEEPFcYZZKAMjsfsfNuBh81PPUWjP8iLeLbyFldp6Dx1o5WKMY/iCkW+0LpA37+
 s+5iC49fKKi/EOTPu0GEY/h1mMQCx1BX8ZehEdKbYOVwaDaDDZyk/UpLHOl0HOYAB2zYj4W5ZI7
 7ONYH8x4QeetbII35HlzqlmjASrN8H4eUoaY1ApqYrq3UeXAhv0rL0XxRPwSxx/lLjU62Z6l6fG
 VDMyT78x+8qX4i9fDKCuayPeoleWv/T+ehhBPhDwFlxpixLDfPFADRdC+gmXF3M45DSRKnmficS
 1GCiASOCJrCyjli1fWJgMHlhMRrJljvAJeX6dZmsGC2eMYXgIG8U3ja0UPRj+SaY2yXLI8mD7GA
 /x/iGpwlRHKjizG+CJg==
X-Proofpoint-ORIG-GUID: ruJAP9NT_wIMRyNVjDWuDVqEbFCAM_Hw
X-Proofpoint-GUID: ruJAP9NT_wIMRyNVjDWuDVqEbFCAM_Hw
X-Authority-Analysis: v=2.4 cv=MYthep/f c=1 sm=1 tr=0 ts=697dbd59 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=5dRrolKJAAAA:8 a=pGLkceISAAAA:8
 a=wQcbvNaIYhuNGspu8dQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=y3-2bcJ53AEkEa81XYCb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601310069
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:dan.carpenter@linaro.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,kylinos.cn:email]
X-Rspamd-Queue-Id: 058BAC13ED
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 
> but community patches have consistently used the name "sunliming" since
> then.

There are several possible options here, but I see that this one have
been already used to contribute patches, which are accepted. I'm fine
with accepting this SoB.

> 
> > > Could you capitalize your name?  It's supposed to be a bit formal like
> > > signing a legal document.
> > > 
> > > This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
> > > your email so now you have to send the exact same email again.
> > > 
> > > https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/
> Get it. thanks.
> > > regards,
> > > dan carpenter
> > > 

-- 
With best wishes
Dmitry
