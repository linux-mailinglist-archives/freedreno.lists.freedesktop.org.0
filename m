Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 198BEAA87B4
	for <lists+freedreno@lfdr.de>; Sun,  4 May 2025 18:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0816E10E27B;
	Sun,  4 May 2025 16:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PceyglrV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C230C10E276
 for <freedreno@lists.freedesktop.org>; Sun,  4 May 2025 16:13:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544FJnIB004281
 for <freedreno@lists.freedesktop.org>; Sun, 4 May 2025 16:13:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=; b=PceyglrV3PU7GHzr
 LuuP7Q12afGV8PbCfYTHmKQsTBtZtuXymMNqsu2dmixChR6erxqUWCPzVtzIT7Gk
 D72ayXTs04CvX8pg1yjiO3EBXBRqHRXpUYRYHBe8A6pSpkmCkApdh0vt9qhFEL2e
 qYe4qDZc0K7MXrbAPan9x/gNIgAWkQxxja4dziSbeCovgizl9DF6pVz8ML6UH7Aq
 eoxo9YtwQQTIU4OTEl7CSA938rcpLUBnFBZNRFns2Jrvjh5BT0+s8qlapBpu3x8R
 Fy23vk+CeM5ssAffU0ROjuC+FH8tK4rnDQixqbzSyXB0ON2tFzzgZIDrvggqZKg6
 mZKNhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj338-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 16:13:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c7c30d8986so411529485a.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746375221; x=1746980021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=86cBgxAbBj1uawgk6dKg3/xrbG+UFcgr07uuksYBAN8=;
 b=hhnWnDuob8s3UTmZBy8aKjIcHt2eFcue/cIiSvfObhkbU6C707myzsabvTNdY9Pwcy
 hGr8gON+RCXT//hsyczwiTCZ6edF22p0RbFm3o/NjxNFL0Lh2Mprp3kw4bZnLw1o5JHE
 IJap7V25si5i1dHY4q7d2TBSlaVZ8HBbPp9o+rsVPwUMnlcFNwVVVKTj45RqASmAsQfd
 C2IO4uPrBxA0QGPpwItUS94uU3JuqaO24RCSLXm0ATYn/vsv7olTSlZ+T5fE4bmLhWHx
 S0weFG9PSUIMHEuWBdQwIIRosVz94wOhregHKLh9QRtbEqUh7qZB7dgmIT84J714/nIX
 gh6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRUv/tStQveyAROk2YqNtr6sGyb5CrVoBRqd5pQkHMr8KVEh4CF6+Y1zp+woi5SdYbrpb8oayAcHA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoaaVHx3k+FkYuUeC6RY0bFMFN592viXZiSnyMQSpXUWxdatIz
 9Y6cqcy3gkl3qd85i9AN9RHeW23KQt1Q5FWgyUUAcPKamodeg4vO+nWZkcjZp84HVdmGgElcfwb
 6CTtKHcXuoTH5bqSth7W6J2RyPUvVqRc6l1sQTMCBADBMbrhSI1naaYA1LUm8CiOfPyE=
X-Gm-Gg: ASbGncuGB4FRm6yn8kqk/0CiPNL2DFTwMJoWUfnClmvZ584B3Zul7yvNGHB5PyAasI6
 jrLDhcuu0XeK9YP/B+xFLuBmCpT8pDn0uoZVobZ/zVkV+iRM9nbeH5L8CGTzRZPR6nepuAvsa7n
 90ux+e12aVKrZr72PoieHLha1IDzxpnFpO01goPMvbEAlmAopORLDAJ/5RGKMFy6rNbAdq5bsjL
 BuhQmGUwqfYfBjoGtcrQ8BRwIRkVcGRUql/POnqTb+t4OgiM0HlG4d6MfrPCQ8kfKhREP8nPr67
 lBYUSWDk1jHhr6rA2eCNSHLdvU5NPdzOtNuJLHavA0h1ywgI79xsQn19wvy24eqJ/RrdAHgAlVF
 pxdIXv1Qdiw8GrHjUcStdgI1X
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id
 af79cd13be357-7cae3a5a077mr572042985a.3.1746375220866; 
 Sun, 04 May 2025 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6F2gMWEMC/eQyOndUIwlivpCZSW5Hk2df4PpYxa0HMFQ0EsGz/WEeqpDE8GrC8oyTI9p4A==
X-Received: by 2002:a05:620a:2591:b0:7c5:5f38:ba59 with SMTP id
 af79cd13be357-7cae3a5a077mr572039185a.3.1746375220519; 
 Sun, 04 May 2025 09:13:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 09:13:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/7] drm/msm/mdp4: rework LVDS/LCDC panel support
Date: Sun,  4 May 2025 19:13:23 +0300
Message-Id: <174637445761.1385605.15776598312432418446.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX7d5PPPWh/D7+
 KO0fbW1PZeZJjvWNNrGsSG3i/rKjQP+z/sRX32XqAtMTuoeRMbQ4DHZsXmCRsAJHBQSJ5uXBGqn
 IeogCU9F/6FuV2lxjRpWnGLYGUOR+mVr4FNzs0vqo4JFI3iSpUScXUxjYfV/FtjLmtP1LM3/TW7
 Fd93tA89289CjOt66WKO5nBjqgtVhSOacGPKDj0d/co60Tx4Nc7VzOp8Enq64oXZok/iQaHBBZZ
 SQdIGPv9/cCI1Feez7H8vVFjhue42wzMwClgRKDW6B59wCsbcykJNFmM3WmDlOfGa+r+zQmVeWN
 0p7zxTzOcfmQIWIRdWKn6iOYqzfZ6PGeq57Z+u5oi7a4cHYtTlXPq8z34IXhK2o7wU9n1JmXk7N
 htXPWwIaDTC3ipKb9DbFDS/baSbqIYOjL/TmC8obBKseSGXHNaeCh+54konZPcYTS60q1OVp
X-Proofpoint-ORIG-GUID: VXW4Cyppb1YglQQadkTU3IKS30MR-Jo3
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68179236 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=JuEGTYreKb10gHM5aT0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: VXW4Cyppb1YglQQadkTU3IKS30MR-Jo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152
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


On Fri, 25 Apr 2025 12:51:50 +0300, Dmitry Baryshkov wrote:
> The LCDC controller uses pixel clock provided by the multimedia clock
> controller (mmcc) instead of using LVDS PHY clock directly. Link LVDS
> clocks properly, taking MMCC into account.
> 
> MDP4 uses custom code to handle LVDS panel. It predates handling
> EPROBE_DEFER, it tries to work when the panel device is not available,
> etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
> to follow contemporary DRM practices.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: msm: mdp4: add LCDC clock and PLL source
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2f1d131147aa
[2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f6720d64d8eb
[3/7] drm/msm/mdp4: register the LVDS PLL as a clock provider
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9c2f63da6a70
[4/7] drm/msm/mdp4: use parent_data for LVDS PLL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b641bf534cf4
[5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f26b80359bc7
[6/7] drm/msm/mdp4: switch LVDS to use drm_bridge/_connector
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9b565edc44b6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
