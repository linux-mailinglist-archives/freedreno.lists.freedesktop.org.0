Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9035EABF641
	for <lists+freedreno@lfdr.de>; Wed, 21 May 2025 15:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896D010E973;
	Wed, 21 May 2025 13:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHLUsocq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652CC14B4D6
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 12:59:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9XMJw000868
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 12:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PQ8FelBJqVusuKqI01bafP6p
 gE/hxiJzISLHy0HpwSk=; b=OHLUsocqu+9QxrOtGR5b1KSyVIms2jesL2go7drl
 2ooIQ74FhKamY66Q2+4rbF/CcVtFhncW+d7IjQGlfS/6WxyhWco7BJM/fZfSbJSQ
 /jtP+SKQFdAmBjeaHs4qKhYeafhEr8G0H0NOpSco7EhBK61YtcRHRiy6zORt3dFA
 R9jpsIOb9YKPn99a/MzAs5bTku9R5dGOMcCVGZxnRFu/ajVq87JZRvC8SmJaygPo
 TturjWUKQhInUc8Xt0Jqc29IZc4VAv/Iq++KpDV7DW0hmSWfAULknkUOFReShf3y
 1wbqL4KTNLWE2IJXFHKjvMkZuXuJTuF077AiM2JOiy1cwg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6tycx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 12:59:44 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f8bdefcb39so86422766d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 21 May 2025 05:59:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832384; x=1748437184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PQ8FelBJqVusuKqI01bafP6pgE/hxiJzISLHy0HpwSk=;
 b=GwSWEhqhX39RplkRlW9/GtW/qMWztwQWiS37RIeaZZwo6Ga7XV74FOADunOEFcmrud
 WKTLw4yCWTv6GkuRB1jkbMmTzL75cyqFflIfyEogJTM0H8PF8YCbNAP8Xmh4TBZuWJgD
 WwCArJAweh1lkjgdpsBNsP1XKuFeomjG23r+giYE+GsEf3d+A8JUcwcjlUaKGUx1Ejv2
 ehQmDEGr5esI3X7IXf0ylqEtQJvY0CMrjRrhyostxjhfegtqoj4fDEeZuRoSCkC1NWWY
 TKikXwdNif8ADAIaz+/W0Qtm5aHwPHtHifhCb3CRsBy7d/TGEEjx0eAv3uYhBM6UpYNl
 3XFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwXehd+QMpn0KzxGO4zCimSXhP8hl9wDaecjZP2INHN98C1Q98TlaL1ejrgRJKdlha1xH+ATl2qSA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCAyX8vW7GAcQ7WfM0KQaC5XR5MvgKpuRnJfK89gANM7LJxS0Z
 JCSlmzbdh+nuBg4oAyjwPUHGCvV+MyFERSlt/ZiV66VvgFQihusNIF6H0pulAd+A9WN1HS1ZkOL
 4Qjya6vXLkDwvSxhGvEUaOv0BomNgLV30YLzVERjftrlu9qrzVMyP81xmi5cqEqro+uTf158=
X-Gm-Gg: ASbGnctPEORDCaz7y0hH90+Uu0jxuHMgysWGgVlLBKV3EmFImICsWVdfvTVUpMu4g91
 5IPW3G8y7mO7zA0FmtZJNfnlIYWT4nveIAoKbLeNZkaZrdOdkMY6gt2SMrGxd2YenrZG9m/H2Pd
 +5ftd/yIiL3/MyAR8FDVwmXDyIrdAmV8Jcd8HWtDAj3HGgSRZH7V4d3WLp+ba7ygZr8cmIBHfeN
 h8YG2To+niCqfP0dwneVADEWWcFN1JaxHxTZ8fN1nys6lenonFwyeSqAPf+d12pIwwhOMyiwh75
 z5cbhcr0IinQ6a15JB0grrzMLTftU4tkbfUnJ/uYwnCV1z2+o1yy+YUAVCURTSiKSQz/BAcf/JM
 =
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr205090306d6.15.1747832383546; 
 Wed, 21 May 2025 05:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUhnGy4gCGjXLtSemtXuIIR5DTpA42yEm9njhcNzOkanHSgLeUZ3VEd2gBEl+hjJ8sTmWA7w==
X-Received: by 2002:a05:6214:226d:b0:6f8:d035:7222 with SMTP id
 6a1803df08f44-6f8d03572a0mr205090066d6.15.1747832383172; 
 Wed, 21 May 2025 05:59:43 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e702c9d8sm2856946e87.181.2025.05.21.05.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:59:42 -0700 (PDT)
Date: Wed, 21 May 2025 15:59:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
Message-ID: <ybbyhri7vydiyowr3iqrizefblrfpedk5it723o254vyklcd5c@cdx7rhx2f3rn>
References: <20250520111325.92352-2-krzysztof.kozlowski@linaro.org>
 <3ywacd4x23zadvwikw4hdprgbgxxdmbcar3lyayy4ezmd5lcyw@3h2oosmbk6yb>
 <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87af51dd-a35c-460a-af4c-813427cdaf84@linaro.org>
X-Proofpoint-GUID: _jXO5h5KMFMh39EZ2VZYpzaK14fALwmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEyNiBTYWx0ZWRfXwSHJ3OA1yk49
 lg8bsGIs5GqFFA8bWz9gLnAbcSH152C5IelmEeY47ZnHaaHVGdfmMz2PWBx2RasUTpBu4eyML6Y
 eI9q4bHPfmEEmhRied7wmm+HC6yK7UmdOdFbhaFJ2bDn7bvUViR/BIS4n08pnAgx2sLedX5/FNu
 r3Ts+TRshwVkcUBEDwuuGbugkvWvQVtSVaBzHY1vLR2pL0sZLxs6W7A2naVuy48KeyqKQPm8USs
 oZ5ZSlZSFCv0FUn31tn96ri5j25spdQVV596myH3Y8UYh1vYI58ol11dQp/ILEk9aMP9+IN98Ra
 nnAEyGtzsy5NVQgYIn1XPixySpBLMu9QHjDfbB7Cj6gVFxe33b9IzOxTRYfgwyDXmo0WLlErbTu
 Ia3+TvSrCVU2LtDNpOOLUBD2pAQMp+WshbBX2qhlSYpSmmwI94b6xnw7CjWX836dTf9ZOfFz
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682dce40 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=afxxqWxysUDinfw8BOsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _jXO5h5KMFMh39EZ2VZYpzaK14fALwmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=680
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505210126
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

On Wed, May 21, 2025 at 08:09:14AM +0200, Krzysztof Kozlowski wrote:
> On 20/05/2025 22:06, Dmitry Baryshkov wrote:
> > On Tue, May 20, 2025 at 01:13:26PM +0200, Krzysztof Kozlowski wrote:
> >> Driver unconditionally saves current state on first init in
> >> dsi_pll_10nm_init(), but does not save the VCO rate, only some of the
> >> divider registers.  The state is then restored during probe/enable via
> >> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> >> dsi_10nm_pll_restore_state().
> >>
> >> Restoring calls dsi_pll_10nm_vco_set_rate() with
> >> pll_10nm->vco_current_rate=0, which basically overwrites existing rate of
> >> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> >> tree.  This makes anyway little sense - VCO rate was not saved, so
> >> should not be restored.
> >>
> >> If PLL was not configured configure it to minimum rate to avoid glitches
> >> and configuring entire in clock hierarchy to 0 Hz.
> >>
> >> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> Link: https://lore.kernel.org/r/sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2/
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > Fixes?
> 
> Probably:
> Fixes: a4ccc37693a2 ("drm/msm/dsi_pll_10nm: restore VCO rate during
> restore_state")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> But CC stable would not be appropriate, since this was never reproduced
> on this PHY/hardware and we only guess a visible issue being fixed here.

Agreed.

-- 
With best wishes
Dmitry
