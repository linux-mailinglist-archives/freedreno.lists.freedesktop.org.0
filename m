Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56637CF038B
	for <lists+freedreno@lfdr.de>; Sat, 03 Jan 2026 18:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2710A10E386;
	Sat,  3 Jan 2026 17:43:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+JvZ4So";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZuMvkoD6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB05110E386
 for <freedreno@lists.freedesktop.org>; Sat,  3 Jan 2026 17:43:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 603ENd6A066553
 for <freedreno@lists.freedesktop.org>; Sat, 3 Jan 2026 17:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yLdE/xpQGwzsU4ls530DdxAu
 84A+AsHGU44NHX+SLHs=; b=E+JvZ4SoCL2o9QkE37CfUUI150wEl5S30h7hx0uk
 WZ4dxSoepoh8UK6cp8EuYtKGtVD23wPLW/tnMNwPJ13GVWbRHN4KAjh+PzHklJWp
 BWBWrn68vZTBsfIIRIpwY1fpfaRjIlZx/oAUWwBeGS4b550oXOfPGcEXPswjzNfI
 5eX/WmCMhPVoBTIqfmT0KinF0KPiaSRzob1idhM+qJUciBQYPmIRVqG6VCZkha4o
 3ixJZ5cjYz3WF3DPotVpUAMXRY/lAI61EGfunseKQ4wtgoZdhzbF0FHaDJa6m0v8
 3cGGo+Y9J8keVrJEkWAljGMPYdcfAGI5s22lKoVdRVmk+A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4beuvd0tq0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 17:43:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3356a310so362464926d6.3
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767462225; x=1768067025;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yLdE/xpQGwzsU4ls530DdxAu84A+AsHGU44NHX+SLHs=;
 b=ZuMvkoD6iFXZecL52rh4xg1+YdDeTkHGPt3afJ5kf98BxE2gJCKW72RnbwXELzN7Yr
 IhVM9+eRTUU/uC7NEDF2jFulWlvEuOJ9UHbDbnfHyIvk9vnWPJr9BQXtZuXUocNLGbJ4
 4VCpIyuS0Vi5Rsgi2KsnwMeAHlCBxS4fZ7QBZKLSeexEanjGOWGxK4ZmZtwqWqo8YTXK
 MhWrtpigTn40AekGiHh9omCKCRQnvWWoqDFpH61Q75jFotU/ZAJ6JP0DgMod/5PEl176
 Lg5I00qGJAa6x9/a5oIVA5UW+GT602sk7b6m+IXRyHqHFJ+6dBMHpriqql226qcnQpQn
 GVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767462225; x=1768067025;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLdE/xpQGwzsU4ls530DdxAu84A+AsHGU44NHX+SLHs=;
 b=plOj1gB6f5TupjlygG3ODTWOnGj+UbcEXYYEEUnRBpUx9Ys0jQkNUtd9CccforQwOX
 aObE16MgzZwR6e1z0qxGMDBqiFIsJ14UNXoE2YlsiZ32YzFTo42yJUb0iFcVw0W7/twN
 y2MDtpvPAbSxZZpG1zpY6AejqoTlnw1a6sMAwSEHD/be2ArsKYf2JASMOI5FnkoLGmIS
 +DohsiImnvXRacBCqTyaQLuCCRKtbINVJ0LGbSRw8x42Aq9RjmcKtEthYSFjlPwcFeWT
 xPE+QefYCO8/SuA79kd0vJQiiPwGPV+yrW4z1FCkipKKxJO50WgMPPYfYUDzYyobvpE0
 rQew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVupBQLd24rNwuperUjzk+Ntx+E0X0s6cviG7bGffH9GaFW9Ium+YDd8FQP9QcF2fpslsiFN67bBRU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrY8KW3th3ezsV7Io1GUHi35b6Z8ctr/VqQa7yBoz+39tnSVLz
 eTYicT81vlQMwB/swTztSSyNFm0hbGWA7Fh/L74UsDXRFAiBj9JSN0K3OMKBxUARCD2WWPxUz31
 8w7sDR9iQhTlEikfFJ21wkw3Uc0pVWfoc6Utq/fC80s4Eoa2n+7HeKTsE4n3xQixRh6xS2B4=
X-Gm-Gg: AY/fxX5NxIcxjJ9lN1HK8MnBRksORbG9jRNtPKmdK5g8/eeefdBbULqXT58XnbKvm7K
 hdWlfvHoDrqBg0oaj06Ye9cn67SicBsElnGhb/lqqyMmoLuXhxhdlmBtNGSdFD5p0CK+xfbkqte
 KzD5zkImdTGSNA5m5z9ydMTcLhv4CQSeKQMcXU6K654bm1gLYbvWjdIcGOBSOovn620mrjRiMuk
 ftdqN5yCdFUCRHrPcmDEWDTFuzdAi0KKXREQJjag1y2pHvBBRij+q5cUojdDnDmJO7VIymZQxdL
 agP6QrSD1t+CcVeFmDZIUNnVr21AcQ7IE2de2I8wiPy6e3V6UsMUl72QC/splDApiI2CxtNT/Ms
 8GI9vdfY4xVC/ZuiuV8OnZ9ioMjicRo9VCeklUTkCSTgsKBNH3pcCxTRCezG1z3+KwhykHXL4SW
 Gkv1e/3QYgetrVVd+KbKswuwk=
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id
 6a1803df08f44-88d82de98ecmr688853136d6.31.1767462225165; 
 Sat, 03 Jan 2026 09:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvBh4buUXwH8hHCMxyMxBVnvpmL2p+DmVAH2UujN9uNS/mkyrJroH4Q34OXeUeb4lhlonEPg==
X-Received: by 2002:a05:6214:2f0e:b0:888:8140:d74b with SMTP id
 6a1803df08f44-88d82de98ecmr688852936d6.31.1767462224736; 
 Sat, 03 Jan 2026 09:43:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea248sm12893915e87.43.2026.01.03.09.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 09:43:43 -0800 (PST)
Date: Sat, 3 Jan 2026 19:43:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
Message-ID: <dw3zx6m3xcavzz24w42jnunh6s36neemst43w375pfhdvdscoi@ap4cprx65rbf>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B215717DE5B3F973+806cb099-b491-464b-b9a8-fd12f2cd1e27@radxa.com>
X-Proofpoint-ORIG-GUID: WF5MLU2IRhVqWC4t0_8BZGCA3GyCmD_g
X-Proofpoint-GUID: WF5MLU2IRhVqWC4t0_8BZGCA3GyCmD_g
X-Authority-Analysis: v=2.4 cv=OuhCCi/t c=1 sm=1 tr=0 ts=69595552 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=9oT6GacGq5yXGAd4HY4A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDE2MSBTYWx0ZWRfXwUx1AIH4qH0r
 sTC1cavs1mN9UjgaXGFJ3AokD7z8MVwPXhGLh4mmi7bVnzU7aEop747Zx8Fq/ipLULyGtXYUmfz
 IBLgQr7WcKfDsgZ/2nxy/cvy040KHBkm3A5bLOSEq0m7CUcu7X2Mtke3sUKdlhbtlkhw1QIVmBW
 yV4Xan7zP4ROQHY1WDt1ROW1oWpWVhKlLWXXNtJHgzwu7lJ8o5sfFnleGiGZ+1GXjL/usqA6FQS
 7MzqLVtQkAbnMDYmNwt8SRuRHG+2UnuSx8CV9BCZivxdLMc1lIIY5v3wezyGK8LgLm93hXr7uCi
 /mDAoiQuXLCTyYmfisWuFmbZcx0bUJ7gjww01VLcM/ZoOZoYuGk1/mUnJ3Hyqyv0IoE7U1qfi7F
 zlQ5DrY4hVD/j1P7m9A3oezdgZNT3+/4NSNERphobKkuTBESjrNSbl5SQ3tnuc+TTbdVcjh2nuR
 VaCQf8o2oLNh4XJYIjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030161
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

On Wed, Dec 31, 2025 at 04:30:33PM +0800, Xilin Wu wrote:
> On 5/15/2025 7:52 AM, Jessica Zhang wrote:
> > Validate requested mode and topology based on the PINGPONG or DSC encoder
> > max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
> > off of PINGPONG or DSC encoder max width
> > 
> > As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
> > for PINGPONG_0, there is some additional logic that needs to be added to
> > the resource manager to specifically try and reserve PINGPONG_0 for
> > modes that are greater than 5k.
> > 
> > Since this is out of the scope of this series, add a helper that will
> > get the overall minimum PINGPONG max linewidth for a given chipset.
> > 
> > Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
> >   1 file changed, 39 insertions(+), 7 deletions(-)
> > 
> Thanks for the patches! With patch 2&3 applied on top of v6.18, I'm able to
> get DSI panel and DP monitor working simultaneously on qcs6490.
> 
> Tested-by: Xilin Wu <sophon@radxa.com> # qcs6490-radxa-dragon-q6a

I've updated the series, would you be able to test it, please:

https://lore.kernel.org/linux-arm-msm/20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com/

-- 
With best wishes
Dmitry
