Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62653C16F6E
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959910E66B;
	Tue, 28 Oct 2025 21:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBP3t+ws";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JnauBD21";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9424210E66B
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:09 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJmAxf2576426
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=8ES5R4cKZbm2579FN/u91MD4
 liydQdt6c70evP352k8=; b=lBP3t+ws3HVpujM9Jh9orpxkun/mQgDlaSEi6xnH
 Ptw3GP8dO5uIgRkyg2ghxRhYkHlxS2Sv51+0/xBRPZsXmirXw///p4aFP5RVOXrh
 Jh2awRbjsnZQxgLeptxBVDEqhnJAGd3czALa137sA1zSAeFyDNKHkV9stX7lxyZe
 mD57fYcAlvQoP8eKW40mE1DoFk2ypVnn4ZPz3Mq5YEizu1fu9Qs2JM+GKC80Ye2V
 DvZ/DXRIrXk4R0zu/ExqS66kHa003dfXw8VIDL7rV/2TbRp3peyQg65C9i4d9OqG
 dXKX2GVpDILSZLlghT8E1lPmUIvfmLPBPXn6b9la9wd0hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a207n0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:26:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e88a5e70a7so10959071cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686768; x=1762291568;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
 b=JnauBD21PNYT/KkD/si6ku/8tALHbgjPVaVYXe4wpj/zM4cu0ePMcolpfZn+lGWG4A
 35MoPLoX0XNy3L9B3ecHAMXPX/wZbgZ2qVOLQ7aslOk2Q0XnRVXBuSq4vO293U73gSOT
 aYbzrNqj8I1zqRksDc0lKLnbo7HWdHrCB6L5QD0H7xf/62myCGi2iqVxhhjcgUe1CObO
 L5n6wSmh7V9WqzMnXLekckRuuklFwkSAjmRv3YRX+Q6GnS2Y7xStywsiAmPZMtT0iD5f
 AOvZVM2zhspxpUGmwze4JGuJvJJ8o58xkE2bKN2dtYCPb7bbXx4Pi9D70viezpRapU8C
 pUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686768; x=1762291568;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ES5R4cKZbm2579FN/u91MD4liydQdt6c70evP352k8=;
 b=nSDd5+L1GxdYrgMoMclieKDcuB/C3NIgAE2XnAe5GtHtF6+xxjcMiF/gI4zCJtcF4w
 IPwWNxOYI+CT4pLbjINs70wHZa6T7TcRU5Y5HAq4LBiBpbVg/BTQUXU+gGA9f5JoAUEL
 /3Wd0SIwiAN7AF/3hD8gGresxfZmKAat6nYKPHktCKd3s4LDDBh2UPSPi/q9kuw4IfaI
 0s5r8l6lhRacoTbZ4LC2g3I9dXPeNDK2O9Klzukd2KprMLZSsrFaDOb5VwBSwbth6EZ4
 zHsuINUR9LC/QIbh27+W1ZbD8lqKzeE8p1hdBl1cXYT5hEOcOLKcm+dZvnA2TcfNTyXm
 bwHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWExfzI0Ruifq+dNoDNmBFpFn8upk2rPaC3nHa6o0qGpSVcPsxM+x7VYwm3+3LF47YU0hdePERQ2Qk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyx/dIDI47Q/05S8QStUpaexozCue2vl+1cuug0eCLCHqO6Xjoy
 slAh+mLW0sMzldJEBXCY8sLQ4aq+AFtlIUQdDzEUQreaJNcJ0e3aWwg5SnUuK/zuG9lpnxKqvpL
 DTaNyGpmpzEQOJEpE//n3S/mpY//PuC2BRmpk8+LaUMAKxfhYywnYhb2hdkMpFiUrFW5qMbE=
X-Gm-Gg: ASbGnctQ0NbH4g5ZSRnNyQjUJhs2SiFb6j46pQlNP2vGxjc3gQ4cW4c/znxbIsZAYzJ
 OykyB0xbDSuQ/y2Co9R0XOkqius+Gznn68eVrm2IgojBUiGGptBErE28ZAakAdv/HmR/uulvHvI
 UijhhxynpAuIJiuKoum92wQOgpS0yB/IXcEnCR4WMG0cRuf/+cg3uZXx+O6EEECRrQTBD+3NHUm
 qkgpVDm63EFUOz3NvuFl8hPwlNnxN/lA0c+0H1oR5MPViYjpbKaSsb/I+AjC8g0ub96IDmCdAUU
 QJ4KxvGux4NQaFa9gi3H7b2WxdfJxh7783YcRH40w7aFMVka8q8V2VETjVL4HrWB/arIR9nfoHd
 NWEkke0JEUC2j4GVyyFNr+jnOniAdNsB25E6H3YToTVETNZh3anyJgcEj2gk/gLxW9ryinjEYal
 2J3xnHZ7X6kOWD
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4ed08a38b90mr56468261cf.28.1761686768014; 
 Tue, 28 Oct 2025 14:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWUsXJar9zGCJLVEydJueQvaPH5F/340n2td2aCFEB4n8xD3QLcbXS00cSHPhDL3ce1u5lAg==
X-Received: by 2002:ac8:5d08:0:b0:4eb:a2ec:6e3e with SMTP id
 d75a77b69052e-4ed08a38b90mr56467891cf.28.1761686767566; 
 Tue, 28 Oct 2025 14:26:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59309eedf50sm1607060e87.69.2025.10.28.14.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:26:05 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:26:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/msm/dpu: Fix pixel extension sub-sampling
Message-ID: <3eqazsv2f2or4l2xkyqetddxmfqmrejlskafgtvbnkfqoutv7y@cjnvezhfwloj>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-b4-dpu-fixes-v1-4-40ce5993eeb6@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfXz5yphRq06cVw
 VcWu5MftWRpb24cLnkERz4eUFhFiJ8Its9LlVdHA0UuGNgLZSW+bM0t0WroGch1Ddbt6B16v0Aw
 D6nZCnpuLLIgU0xBXHl/qUi+LakO2KxtX5ikscq2kSFGPZBlI69C2yqaenPSm99FW7eb8O9z726
 0fn9u+AGDvblvdjFvBEr0o1RV0LKP+8djc0SZ90zLK+sLq/Oerqj9EroZAUl/LfTwPM3V6lCcQ4
 HYPnc/f3naJlVMWwbU90DPzLuso8at3nxssujnzef3TO1JmrEwIKjNMQ0KRBzxmqA1LqG79GJL/
 97sOIyOOuuFOQpV3hgPzJNrzdBVJTWEsN5mfb4UEKqjzNAAY1WTzPXDY/xqEv4I3ES9iMFEox6N
 iERM5rR7KWrcG/q6YQT2AJMNCkNjeQ==
X-Authority-Analysis: v=2.4 cv=V5ZwEOni c=1 sm=1 tr=0 ts=690134f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Y3eLQpR3wbTgfGwADiYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: mlFTzVDmE3wepjo_28nSnX3egKln6JCL
X-Proofpoint-ORIG-GUID: mlFTzVDmE3wepjo_28nSnX3egKln6JCL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510280180
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

On Fri, Oct 17, 2025 at 07:58:38PM +0000, Vladimir Lypak wrote:
> In _dpu_plane_setup_pixel_ext function instead of dividing just chroma
> source resolution once (component 1 and 2), second component is divided
> once more because src_w and src_h variable is reused between iterations.
> Third component receives wrong source resolution too (from component 2).
> To fix this introduce temporary variables for each iteration.
> 
> Fixes: dabfdd89eaa9 ("drm/msm/disp/dpu1: add inline rotation support for sc7280")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
