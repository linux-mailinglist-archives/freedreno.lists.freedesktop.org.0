Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FD8B043AA
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 17:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2AF10E4BA;
	Mon, 14 Jul 2025 15:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNhQqIjo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA27210E4BA
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EF6njT008136
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=; b=kNhQqIjoc5cCmRQ7
 wdc6TlBQ7yruYBIu3W+dQihuwiFn+tK6s4LmFT0vP4gI2Q1PQWK9xiVEVvN1HFnf
 JBou7nxc43Fg3nl8pLI1ta7dTzm5nRspNy0P3KOlsD1nu9CpxIT+ZbWgKyCyYrMs
 fPRJlB5TOlY7F7uwC+4hoo4zT7ToA9BETKyikjMRlHoXc8DltnFt2lQmQ/m/zJbe
 DaZcNUVamVB+VoSCsr3Q4LdyQX3tXnbEyNIfej5VPAnSfd6ektwxfHwOxL+NOUKn
 92seAj5xxzqlrbIVpkhLpwbKfiJYbUTWnZCAwbuu5ZPZyBRq09Ktx4T8Pa8P6aTo
 kfZmEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vwghhdcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 15:25:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d44a260e45so807722685a.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 08:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752506727; x=1753111527;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6LV0K5UJorWZ+7uM8Thq68wdIY0Xdv/k6eWXam/eClc=;
 b=aGwuZti/VjckmJG+5UmiCHb+HHcHdjzKNaVHKtA60l4ADIvHnzJi2/4sSpuoJb3j5D
 ANvyPPS5U5o9KGnRvWhWDvskrV5Fto4fA6iB0koJDrpWk7/j9BO2ds7Aa1NSBNQxBVvK
 TLzGgkstJ3UhF9PcvPdaIQpCx4Fy7XDIK/QSi0qGaDwtS7dazQTRd4x02z12FcgaWr+g
 Rg8bzFRmucjuZUJUC+OVKM5h1jkoIe9aM3Szroqu8iqial/Z0IZpI55EPXEC3RLafmZ5
 krTC73b/4MZt+BqluYU2lKZD8vq6VG5qfRC45klnaxaugkFOIRY6R2M31NdRaYgfsBeX
 fEAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbqw++JGVt+xmNE3/WhyLQFFf16Fu7kqWSv7ikwhhG1WECVMSeMpapGlFKrQmdWmfXq1DjiCvzC8Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRlEMkKcobFys9AbQ/qWFTr2BD3T0T/EWy5xuZlpSSf/dTGOTS
 oOBF+hJHahCXQb/JnBXGKz7/sCuzfj8PROKhz2lbavIT3iv7uhL5/LIEKZcjg/9NoOGN0Vi15bn
 D8jfEs1kXkTebLZ4NKcyxbGJ9ITJKQRwoJe+iaPOj8jNWaeLdpRzJx84Px486jWFnHYJXPXE=
X-Gm-Gg: ASbGncsP+9+e0EFrMIiXpU+G/GrlSiKLlLjgNX+00C3do8U33HckcK3rwqTIKe1kyDH
 jVUC3bQXGns5lkxWXLktcvrJijdw4JslnJEdOHDgWPbwxRQ/mFkH8hoPIt/JJJjdljXpfKGT5m/
 NwSh+1rTCc8qcaG6G/qYKvsV30s0TSsemNi584j+AkAk1vi+IBJnGUj6kW5JNnxms50QdLJi6SQ
 rUPM/w1a3n9cgPS1Q7KCyAE91LPqRvwWKYEOMhpic/A4Y3NWfZaoPHyGFkpvUnaOBLl2D9XeOAZ
 fYewd51OiHYUWL59eMLISmlvzqgTVgtzlP7XTuCzEIWThcFRxmtR2EaV1LlG3c4H2lu/CRjSTXA
 ydF4GYDKEs5uWWK36z/bphC0BKoU3pfib2pxB1holGc6lsPWxI7do
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id
 af79cd13be357-7dcb8aad0d6mr2168478285a.20.1752506726820; 
 Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwZ25/ylUQ3528GkME7MJF3ljBMaRtFCayAvIoA9pqD+T/SbwujgEb5PAw4osLJdBxZhSxNw==
X-Received: by 2002:a05:620a:ac18:b0:7dc:b8aa:d093 with SMTP id
 af79cd13be357-7dcb8aad0d6mr2168470885a.20.1752506726150; 
 Mon, 14 Jul 2025 08:25:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55943b87bcasm1975359e87.250.2025.07.14.08.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 08:25:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
 rfoss@kernel.org, chunkuang.hu@kernel.org,
 cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 0/2] Pass down connector to drm bridge detect hook
Date: Mon, 14 Jul 2025 18:25:24 +0300
Message-Id: <175250667117.3567548.8371527247937906463.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703125027.311109-1-andyshrk@163.com>
References: <20250703125027.311109-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EbLIQOmC c=1 sm=1 tr=0 ts=68752168 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=0YRiGFPyvPvEouyWwLEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: v2xNl3-itOGhZ2sfJ1aoJP0wysl7MHVf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA5MiBTYWx0ZWRfX6ifFpT/OGqPV
 AOdcKSpbBECJ08anh5B626euDXDb+HZH0gitZGmErpbZWLgR3hDlz2z1vwtJCK/RDoaCh0TLvdL
 Z6iJ6roXJh0N/uf0QCVlw86Ep0X8YekOgBXcAAb63Erc6/rvO2GodH/hGOc7dxJSp4SZ3weszLw
 g+jXTzxsYp8U/DQk0+7iLEeTHvSfh7zWgUF5dxFyR4Bibw4AzTzMyNSmTp59W1C7+vUdiV93/fF
 3Ytw58b6X7UmYItxpCLbXak6il67eifqrhNzMUJqtmBYR6qTNVlXWN4ZAOxQe8uBQZwkGZ1SJy4
 FSv69SuoXx4fRCeZDbqAPhj6tUY82GZ7s70Kp0x4LX/i8d7gutA8FttWMMoL4SIoWunyqu8iCLJ
 ebddQ+2T48AyvfhnnUfV7xFnojWTa96kGlAMoxSAHETL2dVum32vAHY9A/A1zyEV/VaKRz4v
X-Proofpoint-ORIG-GUID: v2xNl3-itOGhZ2sfJ1aoJP0wysl7MHVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140092
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

On Thu, 03 Jul 2025 20:49:51 +0800, Andy Yan wrote:
> In some application scenarios, we hope to get the corresponding
> connector when the bridge's detect hook is invoked.
> 
> For example, we may want to call drm_dp_read_sink_count_cap(which needs
> a drm_connector) at the dp deteck hook, intel_dp and nouveau_dp do this
> at it's connector's detetc_ctx/detect hook.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/bridge: Make dp/hdmi_audio_* callback keep the same paramter order with get_modes
      commit: 02bb63d1a59341032b8e7e4021e18d044bdb1786
[2/2] drm/bridge: Pass down connector to drm bridge detect hook
      commit: 5d156a9c3d5ea3dbec192121259dee2c2f938fa1

I fixed the building of cdn-dp driver while applying.

Best regards,
-- 
With best wishes
Dmitry

