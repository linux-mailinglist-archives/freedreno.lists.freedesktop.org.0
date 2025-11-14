Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FFC5B44A
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 05:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4A10E99F;
	Fri, 14 Nov 2025 04:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mSi4Yuw3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYrJq8wT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41C10E99F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:35 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMahIT1699400
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=crP9H9A4OcxAdHeYBDCioqy1
 FA03fE0Brnx4WcqsdO8=; b=mSi4Yuw3Zykfknp8ri+j5F8O/r3CUUMYtJehaVrZ
 s9UZm8BvQtKUNoDJGqI7M2xBBb8P4yUkf13VHfyHHtGOltqpoOg1ZIR3IvIcbhBk
 IW39H3CSBnlLqKQbNgf3gP2bgcCsnzXdbhs9inJCIn/3UgXSIzVJ4MvIfwj9OzMF
 +FzwF8WsWiP5XDktwsu3xvUPsgbbpT3qz7UfPWT2tX9iUVNO00EqpCz19RrGoxxo
 TZz9mMCr0Jh3aUz3rr3PX++Nlfn4LqMOAjz1sUO91Z9Iji0R1ez/soV6A41VGUcB
 hGuSWvLNUH4QlPJnCKmnEq+0wZqbWvmgzsuBXRzT/NmnkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e0sr4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 04:10:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so44405611cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 20:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763093434; x=1763698234;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
 b=FYrJq8wTBK0QmhJ4/2R/TkerdGWLeHD8QBiF7hkJKI4F2pOjVbQP2rpUSY4zRVy7ym
 qXJ3FefzkSlKE+oWncdJpbGnCFmcckSRr6ucLpnrZe0KjG6+cI3onz0ViSbc13IOXuKv
 oaM5QieUfuVmf4JB5EMAoWQXIwA6POgRmwJPc9wEDoD2hJH4oEQ93JhOXubTrr6Pgw60
 Q/4uuCHz5TO5AX4GBdcDhm8cP+aW0D8vUX1IqVHnN+oZj3jPxsuxX3md3I4XBhEa7MpS
 GfHGIDomW65ONtGpYfgl6JAMl7+1ChRNiLiV98+6ajRnMI5N5gQuzwb4PpfESSfYOaS/
 QRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763093434; x=1763698234;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crP9H9A4OcxAdHeYBDCioqy1FA03fE0Brnx4WcqsdO8=;
 b=OZuPFeWXbLxP5uQlR1MhPy7UCNxPAqGVrSqwRg9MmL7plkjPNoiJX3E2BsWLdDD3Nd
 w35vlGQB3/OcxmVwYQEgADJhrjk0u/lG8yy9KGijrftJjlBbWgx7TU4ds0DaLW+JXdaW
 LsAPEKYa1mJy/coSaarFsCWqxQE+5O+ghZ50L0eHIiPDOXT/vqew4Xj3nOtEOB3nPGt7
 iH7lEX1HE6TQ8IgUe10B/zmD0LANuC7zP75t79l6tuEoK8OtPN2RK6cDCbSPeciCcsV3
 9Nc9aG28SKuF7ttY6pzhbYO4MJHF0rq2pAJhzAv5tzEBkAkYMjpPFcm2jSNR7bHr3jQa
 eV9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4v1KlkpMSknmRh7u49DepCczh4Khu3N3+dAJJZAkPLpaD0Z6GYh73TrCGtpKya8+o4wgOVbgR/XU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxF1067M673BIv3svOh6mGOK6g6aBmGQCHDo8ar2yW8ZRwQhO9j
 ykl2haBgOw8pftP4lrOISX829nCdOHi5Jns1qmIQcYHNtyFhdDsC/kmLcEDSVFO8qlCoRdj5HpG
 RGgnmT3eGnYACvVhjrmli+CvMEDFoVD/w1Wrl5m64pbHBM1HJ7afBv2KmFBIGG3CvTcUiSvY=
X-Gm-Gg: ASbGncsRa8v148RVF/87Rr9Xbm2fQoYr0KKdTo1FSp/NvNOwmARnWrz/dbdgLRMuEoh
 xgDL7U1PBa2i6K9siMQ/xE8sgndaEpYAr1Nqgi2vH58u4z+aCRS3jj5vqGjYC3wszcg07ixfZww
 w5er/yLI8syUPIeL5lYwOiiFPV8GT6FqIj+mWJ/Rtini/VbnXTI/bxX+7sezzdJwBTFHedeQtGD
 nDfnkdykSMzTvZm9u9w70biL+CeMF6b/q+QvfOEB2Dna8rPzSKm/Owc6OMGKXoKPiVOUtsdrbkW
 xmr/5/FIA4GijyM8s3TpW6aEcw62h0ux+11Uaps7Mqd0h5KbGsJIB9dhKSIlVeQAGlL9eYSxFUC
 Zwg8n62kvB+BNz9UStWwmwF2jc/S73wnUtdz6nfIiAj7WiC2rkPV+YRY5E99J6frtk6KEOP+Q6Z
 wNPoXK2OGAsnxy
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id
 d75a77b69052e-4edf20548bfmr28626611cf.18.1763093434141; 
 Thu, 13 Nov 2025 20:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkrItC4byFnxIb/MoLRr+P54Wcvm8Kw5FEvzyr+iEPn+IuRhxLLOuNt9CdpWzfVeAdyLyKdA==
X-Received: by 2002:a05:622a:101:b0:4ed:1ae1:5390 with SMTP id
 d75a77b69052e-4edf20548bfmr28626361cf.18.1763093433637; 
 Thu, 13 Nov 2025 20:10:33 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040d89csm781380e87.107.2025.11.13.20.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 20:10:32 -0800 (PST)
Date: Fri, 14 Nov 2025 06:10:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Teguh Sobirin <teguh@sobir.in>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Set vsync source irrespective of mdp top
 support
Message-ID: <w3fffuitwki7imcpc75m2e5kv5fpg5nj6udpxytm55kqa4mkud@rkl2ywspwm5y>
References: <TYUPR06MB6099CBBE5090DB12A2C187E3DDFDA@TYUPR06MB6099.apcprd06.prod.outlook.com>
 <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ukz4djjytsne3y2w3epkdc7gzegmeeijpcqblvftcx73ccs43p@es6b4ew4nrzx>
X-Proofpoint-ORIG-GUID: i-6CkqN350BlfXriLR2u95GZR70ipId2
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=6916abbb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UYdELWV9MdadiCxCyV8A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: i-6CkqN350BlfXriLR2u95GZR70ipId2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyOSBTYWx0ZWRfXwMzhDR/Dnbhw
 5+/f4BamUICtJiT/9tJNH9drHEeaJpm6M1RzapBEV7MwhITPi+u+wrUZHAj/S/X8LxG9tSh8pgw
 cKGfWBkYAKmFYpjSrTFXaq1Bwe1lnq8bq+PMzhIKtbne0KNT5StVDepyBkMk9WGr8d+4X+8Ej/G
 1hb3JcGRD7dRS26/cJdTduI7Msq5sbYTcL5ugNV4a78iqmgEHDDCaFMiCwY7YQlalhm3A2daYTL
 hqn7K1SYm802R2vkTx1QH+0aYlrAfy20qixbCuVE2tt8OsZWJ8QBgvG0AlUCP06YNhSAjCC7g2y
 CIeRcD5vNxxB2NlarVCbUY0RuLtUPm+1x+xgAJOEwXfcBll3UROYptRtgQBzTV3Yp/JI2dKWcqR
 3oo+JKqTMJqg7by+PcRQ+hoFh4PpUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140029
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

On Tue, Oct 28, 2025 at 07:02:28PM +0200, Dmitry Baryshkov wrote:
> On Tue, Oct 28, 2025 at 08:36:35PM +0800, Teguh Sobirin wrote:
> > Move the loop over phys_encs outside the
> > hw_mdptop->ops.setup_vsync_source block.
> > This way, vsync_sel() is called for each interface.
> > 
> > This change ensures TE vsync selection works
> > even if setup_vsync_source is not implemented.
> 
> Please see Documentation/processs/submitting-patches.rst. Don't describe
> the change and pleasw wrap the commit message on 72-75 chars boundary.
> 
> I can suggest something like this:
> 
> Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> INTF blocks.  Currently all code to setup vsync_source is only exectued
> if MDP TOP implements the setup_vsync_source() callback. However on
> DPU >= 8.x this callback is not implemented, making DPU driver skip all
> vsync setup. Move the INTF part out of this condition, letting DPU
> driver to setup TE vsync selection on all new DPU devices.
> 
> The patch itself looks good to me.


Teguh, any updates on the patch?

-- 
With best wishes
Dmitry
