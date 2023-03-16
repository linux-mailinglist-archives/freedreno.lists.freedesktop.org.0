Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9686BC271
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 01:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9247F10EBDA;
	Thu, 16 Mar 2023 00:28:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3529E10EA39;
 Thu, 16 Mar 2023 00:28:31 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32FMaB9B020299; Thu, 16 Mar 2023 00:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Xj6nsssU+V+ezlW0YZ7mAr9/dBVwZEvq0GmnbnqRFdI=;
 b=gZpUInWB1e9IjNTaUMijXqZCAZsenKCTSbO968vM2Se+MRAsaLW+Cu2ZLmSdLixDl16m
 FdkCWQBdseBvug/lRXkpu6hvYR0Sewja7nsVoWRnj3uz9dNL/tLPS6ZnxPqJCdp2DzSq
 cXdQb1tn+gqY0IYHNBnP85CPFGhXE1jrq20LjUhC6WRo0Q/UNr8qUt5Lsy4VuTlqVF24
 Snq7MPDleJZfgOii42e9X0ZBAE7agYDw548DwU8A/3Ra5qZXAMnhFKe6YYr9Odrr1x8i
 g1FEJqsvS+x5ujJ6ux7Mp5TpOBnKGRhXbabqDmSEW1SjXDyJVpNtNyEFReLX/c9Lm5lw 2w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpy38735-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 00:28:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G0SKgI024494
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 00:28:20 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 17:28:20 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Mar 2023 17:27:46 -0700
Message-ID: <167892634700.18235.6967718018085667924.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: d9_2L3lYx-Lfh2HF3vXq1Iw6hpvtbhdj
X-Proofpoint-GUID: d9_2L3lYx-Lfh2HF3vXq1Iw6hpvtbhdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_12,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=817 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160002
Subject: Re: [Freedreno] (subset) [PATCH v2 01/50] drm/msm/dpu: set
 DPU_MDP_PERIPH_0_REMOVED for sc8280xp
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 12 Feb 2023 01:12:10 +0200, Dmitry Baryshkov wrote:
> The SC8280XP also has a black hole at the top of MDP_TOP region. Set
> corresponding bit to disable access to that region.
> 
> 

Applied, thanks!

[01/50] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for sc8280xp
        (no commit info)

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
