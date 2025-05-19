Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8C4ABBB99
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A0310E40E;
	Mon, 19 May 2025 10:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOnMGi7A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3048F10E3E1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:54 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ZpDV010096
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=LOnMGi7AgMhX36cD
 0gSRiO2PXSIcgAPfk7iWbavD7juGF26n5lAygIki2uGCpAuLp/2LM+b4GXjvQuan
 f07iPfqbhI6AC4yPL2qPlw+ttfXFrhDL6lHsdEVBeRRyVmPF/8bAad4RP+2anlJl
 aSwCfw5MTZNyImYcLxRYJ3YSuAOd6Vb/smc7A8leVjMASOFtycegWclgVOIE1xlp
 bgQBCAbq2EWgQ9WfYIHiHwTub1zUaf/VdyQagJkEO9QDs5JOi2yY6ItiAq5chsGT
 SY1V7VsRn/ANaVC2zdZjyD2vsN6gjSUk726J0it9hhn3Pq4KFAF1CEE/HmOcC2r8
 vqfwcQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7c2y1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:58:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8b2d2fef5so52131526d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652332; x=1748257132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
 b=eUiAbC7eXncKIVl5uy48PCAeN61sz43Nxi4MklDsu0YyyCQwy6sla7iUa1wmtdUJ8+
 HPVZa80sg8LT1jy3bEwtrwj1U9dsRSKf/mvJ9YVHlZAY+gANGYr9ICShbe/0++jLbUQK
 AQP17UHA2cwOtspLSpFxRoYRsCgjsSsnSnBlY8ZacrJy3GGxO7+Q3R4cxTJ6ihplZCeA
 VnWkBTuUkrqa/2VZkwxaNnlGJ7FWD8q/It1NOtcC3gw2ykAi9c0/TRm731oT+56BVl20
 sNzBtletCHvcRM6JNwgkT3WWSUe2qX2pIk1+HkhOZ4+UT4qpWisORo3XFrXpKEkJ5E64
 ZWow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl3PRd/LCpKyLpIUAW4ydkmO3B7Xsn30Ha6h5O/Sal5yVOeVcqZUszh3HSk97RnH+mWjCNCMVw7Cg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzneVc7C2HNzeqoj5h7rY4xAwgt8algdU4nI8DVdnmSMo9HKsou
 5hdS/j5iuTx9RhtCJ0BazhCyMe/9M6QLdDAuFmaCrlxbCfObcwDsKSQrUMV64YHDbfszrBV7cfc
 hMKST5VZxkTg3UUlukjYfY0mdfmlukVNXbcdSNjGJ3cW+L0pklDHrxr+5JXe1ute4LJWvV00=
X-Gm-Gg: ASbGncsgT2Usv47jfaZgXFMeNa6FJbvrwB74wu9GLFrL668ed7pF+YGjfQkM6NIUspo
 5JnXx1b9l6wDgg7gWNOnsVcuZ/OCu9ysxBW9lq6z8HXFrgIoZxB9aZ/fvytQW02QsXd4Hcb8E5E
 GGTnYMb2F+l0IqBlnkZNjyF+PmFIb4YJhD/H7TxJmF36oCxNfC4/qKWABHN+UXC+vifLWEdGsVt
 FNkR2geTkkRnmfPlzf21milnRys6d1dz7+PiAFvLeqGkaXMjUrYlkkg9x74tzHKdn2v//gCh5iS
 NuEj13Wa7DEurklYBgt/Sj52bLoVHTBvRSMcE6AkHFX4GudYomG9Gm1LVefgfpIUBpNCZ3Imh12
 oc9JURArga8bzLJ/OF0F3PzBW
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id
 6a1803df08f44-6f8b0877c06mr210711426d6.20.1747652332479; 
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrSoFENNThQFwHFQnIjtZ3G2QfxB92xA08zp06I/ajWbkOSz2fGe+TRkoQyETd6W9zuDBS9g==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id
 6a1803df08f44-6f8b0877c06mr210711186d6.20.1747652332123; 
 Mon, 19 May 2025 03:58:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Mon, 19 May 2025 13:58:36 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b0eed cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: I597nC40clw1FUibL404EYv5cZW5nJMk
X-Proofpoint-GUID: I597nC40clw1FUibL404EYv5cZW5nJMk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX9ou9kapOiaUw
 Jm2Ng22Dyfy+kinVjAORZX5Satz3zbQJsHW97O9W4LZj82YhQhvzg9szD75hj46hALw6+PrNIPN
 xYmbBGIKtc8zG7MAkdo/3J/3mUAj9cqPCSxA6PkUQMpCajKrnYX60kbxlgFgDVuj02lJvIVJ7my
 JULcKSZxYuo3MIEo8enHsk1DfJXTbOWyTIqut4qSjS+dnQUqcD6tYuLPFWyAcGPbb3CYkhz+JwW
 vcTphDtvStuM4FwaIO4QoR+dR8HG7PHdxSedPnMb1yS/lJwiKaZMeH0D64dUtX+/YOiINVjean6
 3ZsymUpy34M63mvjkK2zCpfwYOfbAdFUQ9/evdjgIp5BEMUMEwfakcpsQ9xrSV/yITXygdrWn3P
 3fVH0GpejnlGGwh6QzdpSrHV+9y+457uH7wq473WIAS0JeVt1Hp1iiezdBKictPLWUbw7fwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=616 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
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


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
