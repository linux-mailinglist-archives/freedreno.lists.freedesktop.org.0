Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C35FB0F0DC
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC17710E33D;
	Wed, 23 Jul 2025 11:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SGGBfEPr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE56C10E33D
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N97s72009438
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=o8v/bH2NBjx6+BJ/r65MfwKr
 xmq2wQHUa+XHZT7+W+g=; b=SGGBfEPrF/eX72+93Lw6lKpkf16xoPZWUMRMXU4D
 rqgLNltlyAsee1NqncEyKzv6vDJ2sW6t7neWKE1jKxMxpBXRu3N/9AmswkySAh//
 Y5CGliP2+qiQ0ijEKd6ya44NXX363WjF6Lht45zGyvD9plt6/Zi/BHsNXaLPd1RI
 JZQvyh+ZQp9db6fw8Fsv+UjyjMfBoLBR/vhtDc8wqA8qC9fIXOR7sC8hj2QzItMp
 Oib8Z8wsvOOnOjEGPDsumsAV3vj3tWINJPoTX2Rn9SW8lben9deCO4iHKprj/qun
 QyXxhJlAuQ54sAoUfuLXi3eK/ogxdRvskC3FfNXKruPJGw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na3ask-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:10:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fe182a48acso15710596d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 04:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753269033; x=1753873833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o8v/bH2NBjx6+BJ/r65MfwKrxmq2wQHUa+XHZT7+W+g=;
 b=SSDbIJQ0PWqF44rO2IyNZKX6wpNoxY0WhJni+fr338Ob5FSvNTSTceEK6k3FS1LkQM
 CNKSKqeUkt/6ww/j6R7ulUnJXAQ728/FSafYEudS/JvTskujDQvWgLRzr37NdJaZFPTy
 QqV0rwuoVDeVafU69zy4rMpL/WC50BFybmcrk++P7R7oAHN8fUH2mYwfIxIKoFsUwaPQ
 2BP++PKjwiAD48Ehfs4ToX3aQmZ76qYIp/CEEBEJbM4AmmS7hrPUi74T1Ig18KZPLox/
 3anEKATTWB42ON3X62jmkgGF6lEWKWErm3/xSzpt8WtGlCOwgaYHm10O9cMMgJOtKb4X
 kIUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzxiiIxb5ygjEug5hzAmNpfHCsXYw35ukJVCJkFvkrZ6wYenh8cwJ2ex6J6OSELY7ZdLPy4er1GBU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyduVsadFYcbM2pAaNPw24ntqzYDraoLAdYoOrqtCe4huAh9fQj
 ASBN2+TpmgIrezPhXX9Kt22Ib9uk5pIuCMRiCzFmsjnhaawLojd13XEvY9xC2c6J9Af/gG6fASj
 U63/Jw9sBmkC48MWYe47orG5Rrqe3OEzzgFMmSp2TAC4NCPPPjMI06s19lHDPrzh3Jzq7FjE=
X-Gm-Gg: ASbGnctSE+LSP2iSgS0vhVIt0Czq8MvnoyQLKgOO3/9s+nhFIDDN1bXDXJs22vJGyRV
 S6zMdC6g2+NZcCyuhNhqd2QF7mddZm9Z2rmSef80uktFChgV/B4v6zXJ9iek3p+PsWJrgy+QWt+
 66GdrkoDIz2noHT/W/L+TnQ0UtcOR/K0kO5yrkvsVaFoosQ4PPM10OVu8HCfe1YqapGttnPd0rk
 Rik92qMaPW/kaAP5ri7NwoKf6rRq5TpmXN1Ni1B96wU3wnLmC/t39LbQTiSSsQLdI1s1SacBFmi
 o5iSelgge4wxEqjgKWX9PnArmJUNIudqEtJpVG9gVhyP8sRioDN00zI+QXfzNuSzT7/JTBHHUiV
 BNMz5goaDINqF2i+nLDPCrYlwIrKjrhfB7dwHOC6qxZQLBn5Q+Ixo
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr95429386d6.24.1753269033031; 
 Wed, 23 Jul 2025 04:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKX/yJfDO+WKJkcweygCNZ3fLCTvl7U9+hFOTGqWhqzh7qpDIFbc61paUsq4qoz3Ql+XOQtw==
X-Received: by 2002:a05:6214:d8d:b0:704:f7d8:efe9 with SMTP id
 6a1803df08f44-706eb97e401mr95428916d6.24.1753269032389; 
 Wed, 23 Jul 2025 04:10:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9102bd7sm20831921fa.27.2025.07.23.04.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:10:31 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:10:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
Message-ID: <jeg4dw6wpxpfaio5kd5vcbqswq5nlclor7tbbh7er7zlwgdgxr@ksrw7waxj3mp>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
 <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
X-Proofpoint-GUID: nk_isvpAsJRGDXzzytLDbkHxF03qawPd
X-Proofpoint-ORIG-GUID: nk_isvpAsJRGDXzzytLDbkHxF03qawPd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NCBTYWx0ZWRfXwIcxZeSZUtNj
 oiiPby8Lgvo0HsZGp7R1W8G4Px4b9Lp5szjXDmUcMP7Wtb870EWRuJeVkpZ5nxouhJ5KGRn93DA
 omvp/GUOnwU4C6Q7OJjruI7AjQpYUqVyKbd79kzIwcKlob/uOvMYlcaOHa+zfs0y+2fQRhpr+5p
 bVtQcQBcgg48JSbnNe3suewljeBy3ZRtP26zZPcMCh8RbvBeqqAP/IqsGu+HJvGMX+UYyBH7neI
 i/2+905Xwfu+Yf8LuTv40+zOOvSKv5E33mUW+npFHktOZik+7fbIO48AMlW8Cw9tQB6SoDkDF/H
 5hkN65XupfbanBD/jo3GQOW4k39o7I88Ksn2lKvucTISAaTE4CJciHxBVcY1oLaNmDTHtEwF3zk
 aXhIBazuTzce6ITRmsGnCj+P1NuvGeTe6P98OnfNHq1tCGtZElFvmYE/qXYDitQJnz/Mf6VH
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880c32a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k4jRfATEMmhf2Y4IZEQA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230094
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

On Wed, Jul 23, 2025 at 01:22:20AM +0530, Akhil P Oommen wrote:
> On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> > On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> >> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
> >> different in A7XX family. Check the correct bits to see if GX is
> >> collapsed on A7XX series.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> > 
> > This seems to have been introduced all the way back in the initial
> > a7xx submission downstream, so I'll assume this concerns all SKUs
> > and this is a relevant fixes tag:
> > 
> > Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Dmitry/Konrad,
> 
> We don't have to backport this change because the existing code reads a
> couple of unused bits which are '0's and that is okay when IFPC is not
> supported. So there is no practical benefit in cherry-picking this
> change to older kernel versions.

Fixes tag is not about backporting. It is to point out that there was an
issue in the original commit which is fixed by a new one.

> 
> -Akhil.
> 
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
