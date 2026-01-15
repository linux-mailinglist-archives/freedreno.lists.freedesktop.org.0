Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647D3D23A45
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B29910E72B;
	Thu, 15 Jan 2026 09:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIzrw52w";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cGtT/0NW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11EB10E72B
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fiv72073801
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=; b=BIzrw52wb284a3RZ
 ueDn6nL/2Yb8dg2oJuqBVDzBL6UHUPm0g3GmwUNP4HR0aHfe8jGK6ym9vD/m3J+C
 Dbm1M2QPulN+FLFgWlzlCB+w3QbbX6HluvfSq5+x4DIxuUlVRe1nYmi+SiLRMWli
 05w21tPq1bcKc6s8NP6y1d4tUkxAHG4r9bpu0kQrd+ZqISmydPCrtlAxC5YluTY4
 NY1//bGkqDingIxv7cjGAOl6RLsPx0Z948k5GKwA5SVuVGaa9w7laUiQzsIPZDm5
 i9nCJgn5FD97M4NZ5a8zXse9Txg2cwyyfxcaUVihxuh92PRtwtS+tLpY/MQjIp6r
 qYEGyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj9j11k-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:41:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88887682068so1886156d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470091; x=1769074891;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
 b=cGtT/0NWpEtgcn+Dv12LiiCl4dciUqiJbGdOcUN8PgP2fJHcL0WXKI6REZpRbden5R
 CZcCb4Qu14bWcoYIQCP6tQD1LWHpPdGBflACcPIoTSdiQ5tMuDLNxkgzfkX3kY5yHR/a
 L9GkBiw7jGDIMmNoHONTidwxnLvpPwH/SmmgcfP8v/HKGfRWgnvHbshTje0jLZ/2Qgfc
 ry7LCUhwOa/bmM3DLpYKtyyYkQHr9TvoM9P71RYtEtPjs7CPpTMIsZnVtzLmv1pBr6XT
 0jS/jGPM1S9rv6iz2dHK8vRJ1GO7WNeq8OeNAL1stM+U/jVp8dLxqI02P5akjPtk2vsh
 LA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470091; x=1769074891;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aaG6GhBvvrLNb8hNHGF7AbN92F9BWAyA46Rmsn9GNog=;
 b=UcUteTMGYTiuijdeXrMtlc971mOFijndqHc8muhXVb2aI1xVkMt+AfptVwdGDGE4Nl
 j/oTbsu7cPbwALBToOFgmTgjW2jVT2VSP+e95OQIP0tHYB1V/n/PyJMNEsoWHH+aczyK
 vJSMdFsFCikLebqgA6mSALykey2URj3XkP9zRpn3HORoHtpBqneh78s4BYmGoT5KfKCA
 3SftcqoOS9CWDM79eJNjIoTdxrOWMxfrWCLXdXrys7n2pmtbJc3CyJWqVd/I6A2GRJGU
 YB8GX+UztvaJzyaddfNK9AiMrbGQrnfkfJ1ovDsGyxRk87f+blWU5pLrgj0sMIOAmAAP
 DFIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVc8cOYBYvAOs12LEchjsb0/fQcJ74/+Gu50JSHRQ4YkOHxnveyy+zd7UREAHyorCfL1YAXDTZSMjE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycFCKt7n7pLvvvbtbchsPZlTpcMmCH4YSz4l5jPrhKVM0YmePd
 QlNZJ4FS6AgkJ270Y67jArK3K5jICQHgxbrEqKrI85HIO5DjI9pFHJU+Sihn7Z4Pzh98brSHNVN
 0lBliumKL1xfwIPGHjwCtEQi6s6Yb6qfM5zjmDPPjBOwqJs2q+x+1ZPAU5kVwMag17dqGwWE=
X-Gm-Gg: AY/fxX4bCq69sB8qzSSZUmaBv3M5lvbYOQCJW1zNe6QTA3qCVEBkZNsR0Aw4eu+LDlD
 G6m9TsCD8q+QbnnwburM7ey5F2JWHiQUlRc+SC7mSd4cUtVoUEaFLCZKVhvIEql76rrVsAjk68M
 vC2OSQD4kQeTlUcQJiMUrV2kMErdECFx4hQbsDE+QGfcqOa0xJ3hzX0cHGFb/tXubrW9bhEZwA0
 mdm2QvhZ4mlKRm0nTLrM5JmHnr0clVHsTRAJWHboqRCiTkuFbGcJjSCPjsRG78nf0Z0rUzfMNoC
 EOOV6Gq4dj8mzzvJG+oEckBXc1ihdzAe0bm4cvhK0oYZ2X54lGx18/0mVbmow0QWvlLHyAFwvQ8
 wtdOvWKHHRgW8WV/2BVWxNXcgIHc2J2QSfbJ8kV3IcXBp23/D8OR5dpTcMHun8Zsiz0c=
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c53892a5b2mr244248485a.3.1768470091248; 
 Thu, 15 Jan 2026 01:41:31 -0800 (PST)
X-Received: by 2002:a05:620a:6a83:b0:8c5:3892:a554 with SMTP id
 af79cd13be357-8c53892a5b2mr244247585a.3.1768470090813; 
 Thu, 15 Jan 2026 01:41:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b464fsm58436331fa.20.2026.01.15.01.41.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:41:28 -0800 (PST)
Message-ID: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 10:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r1Yp2P1Ms5H1TDMz89r1bwi8yIxY0mhe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OCBTYWx0ZWRfX9pyv4z1ndOUd
 6A9T3VqIUVRs1AoE+UPgMqIAnnuHddsRpCU+aKWHubTI+lTcq9nlv3c4nxXOr8edR7zazCOo0Pb
 qn+r+3FBz0EafDBhE1yYkV83qym3vFupH0LoPKu/VnMNUu7g4AjoEN/awE3zrL6+xvATgM+awHp
 a9W3tRKfM0w8xJtN7tiKS1Kqjt4rfqYZdIiAHp2RbS7iI+cJmI3i6OAjr7HLkIP1opGu1vITdsW
 GTiPAbfZSYr2PGQP8HheeD+GT6IggBnlx3pfyK3b6SV/VtoUfNf35rMbIH1y3ourMxDv4i9zua4
 6Ll9U2NoOybr/McZ2mgLFZ3pqid9WmQ4WuKHPVc7AzXLyI0VuJ3BfIZ+VTEglF80ZmANel45r/B
 awVv6W4eRtlCR3xo5Fq3g+vGZNPMfU9/6njCT2kWsZBN81Mt+KahGUOnKP6mt0OJmLiU7V8frk6
 PJtyaBBfkAl51F/x74w==
X-Authority-Analysis: v=2.4 cv=dcCNHHXe c=1 sm=1 tr=0 ts=6968b64c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ls25Rwon0kCaizU-UYAA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: r1Yp2P1Ms5H1TDMz89r1bwi8yIxY0mhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150068
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

On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> Currently, we queue an event for signalling HPD connect/disconnect. This
> can mean a delay in plug/unplug handling and notifying DRM core when a
> hotplug happens.
> 
> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
> handling.

IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
also prevents us from checking *all* connectors if we get *any* HPD?

Konrad

