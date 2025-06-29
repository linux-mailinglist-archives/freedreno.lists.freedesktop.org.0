Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A59BAECE09
	for <lists+freedreno@lfdr.de>; Sun, 29 Jun 2025 16:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D384B10E356;
	Sun, 29 Jun 2025 14:45:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oECh7iqW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB0210E34D
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TCwM5K027160
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U75yw7BMC/S6igk0SQ7PlAp8
 c+8TFboIWS9Vq7PTNB4=; b=oECh7iqWHwXVcfgXCPhAZwgrgIRSNp1O4g18tRPQ
 G+cquXTpg7+KbIZ4Bcle76waU/2UcVfVOpAYetxIiGcxg05xJoJptjI1n8+qfQkO
 crMlx/koLGQ6Nzsym5ASCe4ikNAhAp6YQkjnBAR6rvHGoSGnHqRWrn8jh202q/vK
 VVF+5OFC1mgxwRNBjQKH0uEeGPRnaQRZRrkhPDkQypXmPSNIFl7A1j6deZbC5Bek
 ydDRgJ2sYEmcY4gx8V1u57Ea0OKUOJMsM0kiLN2KmtwwXejR81YXUr6f1ayfHRG4
 Wz/h/Y91x3I/O1pDMB+1+VDZpjeDnanG/84dJY3teCxCog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7d9tb62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 14:45:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d099c1779dso175929385a.0
 for <freedreno@lists.freedesktop.org>; Sun, 29 Jun 2025 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751208319; x=1751813119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U75yw7BMC/S6igk0SQ7PlAp8c+8TFboIWS9Vq7PTNB4=;
 b=N8gmO+nOY0cTMjg0oSf33svIOvslE+Pdb2lvh2ifRyx0E+c2guRMS4Cx09x2fuoXlL
 x+peHfjBGH7NYmH+raSQAQkQfr/go1LgeeGP6FjcvgIDNOgCPTDxzGDh+d3F6BVUT/oj
 V0H1feCR/CqDbfSJgRN6Q5OAYhdDYX347nBKMCAWb95USolOkEAVttJP4V63L//2cGni
 e29ONnmqQeHR7NewpG1JcnH/B/lTDVtucbcLAgQpd5gAFnkk/axlEUrQQN9MmdsvDa3L
 x+fQGrKzPxtC+yOM7sXAruhRJ35kVLcH+jCFu4hJoKW18AIyTuZlMHcUVNlgX/M+jgNZ
 VDIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs3iIQRf2jjvsVTAsw+Eb+8MInttkJO2ULjRFNLFpBav8Ab5YXNYsmakGI4IJccoeFRbjHA5cfM04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJZcr7i+YmacJchfmhDsjCKn2wQWtKwo/0ZvgXHd/ypflBymNp
 VhFINN/ZgO9pT0gE0xWuJ3xfk5re4X1XGsuTLkvqosXDZwuZJV/ckOvxZFqup1oro9Tp3zSRAqT
 bh6EFKVJEVHOfolGhKl2hbxmvfvxJfUIlHqBkdDTMh1Oer5551BbVJkPsOeqReSwhNKCqdRg=
X-Gm-Gg: ASbGncsgxH8jts7M6X1gg4EV1JHquLGv5Yw3K8O9mquEhzxKaptOxOUr8jFocTATVRV
 ZukMT0jWBGiMLkXWX/MVZykx6ToOBHQanc26l+1l5sooyoLFXoEqXWlAAAuhoE4yfo5W02F26wW
 BAVxOeiApE6tWoDiK0Wg0aNGpnQt3P79lizreLCyC+xmlAmOxD/LfUNZlfhSf16FZ4+vBjeMDvs
 hiw9uMXdG05VyYBHA+sUErIOCp4IkIPFx3NhCuGBfj+YCczHF/xiMy+PXe6IqiCMtNY0Tb4ZOZK
 Hxz93SOmnzGZKzLfFEr1wVPjLeYUABFSLVfxedyG67fvnpIarTPJd3CgLhabOzy3O8qSUGkD+W/
 1BGQFRkXXmzeh21dpVmc9gwc+WWJ2iNgPxI4=
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d4439b9679mr1537818985a.53.1751208318668; 
 Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCYpAnwJ1rYQ1S233FYjwYu4oJCVh/e3dqa7Xz6LlKsV9YCedkRP+JE+l1W66OWbNHR1zgWw==
X-Received: by 2002:a05:620a:400c:b0:7c5:5670:bd6f with SMTP id
 af79cd13be357-7d4439b9679mr1537812885a.53.1751208318157; 
 Sun, 29 Jun 2025 07:45:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2cd99esm1137184e87.158.2025.06.29.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 07:45:17 -0700 (PDT)
Date: Sun, 29 Jun 2025 17:45:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
Message-ID: <nij26lzoinzr3cbfmvwzigtxpsjibaudect3i772swbnmyuz5w@2jny5ie3oqw3>
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDEyNCBTYWx0ZWRfXxYyccDtO38Y+
 38kHquhTNCAjnQz1v4TJ05R1l/IAezCSiVtlB+yZbsqVS7N4RoYD5qA0rWj5F/7AbucYQxRuaip
 vL9NiIUZ7ZinAANCGPw1d8PyVY24t+mNKboPVKzQFujmWMLTMgsd4IZrmUjxrnl146ZSL68ytr1
 4pDlJETGKM3YLEjlG0GgTogh3wZBO+qL+Q1Bngab22k6YoHW/3L6worJJacIwQ0jyGTCFzj/b6a
 1axzIjVTjh7OBIaenI0k60knL4MB7dkc3NAZVLpbl00DhwXgPZOuse1393k5yFSgkWBByk5UABK
 p9ANDm+YQIFqIBJ7SxApvrNofbFgEDhdkpGSJmmQHlkRbx/61TWKneJCoELKfxbb2o8d2kg7xvj
 vgG5KOfyaBgmOOV3G99hxGhaeNG9h/cSIcUDUv3anOh8YRYE7aHkhxI4HGNobYCKerI8uAQq
X-Proofpoint-GUID: rOXacN1ImkkCLMkNNAkUs12X5Cly2Xt7
X-Authority-Analysis: v=2.4 cv=RrbFLDmK c=1 sm=1 tr=0 ts=6861517f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=zVdBlVQdkfp4bBuhmU0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: rOXacN1ImkkCLMkNNAkUs12X5Cly2Xt7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=843 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290124
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

On Sun, Jun 29, 2025 at 06:58:41AM -0700, Rob Clark wrote:
> These runners are no more.  So remove the jobs.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/build.sh                   |  17 -
>  drivers/gpu/drm/ci/test.yml                   |  14 -
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    |  29 --
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 139 -------
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    | 350 ------------------
>  5 files changed, 549 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
