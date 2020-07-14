Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D74521EBFF
	for <lists+freedreno@lfdr.de>; Tue, 14 Jul 2020 11:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C446E891;
	Tue, 14 Jul 2020 09:01:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C7C6E88E
 for <freedreno@lists.freedesktop.org>; Tue, 14 Jul 2020 09:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jd5rZEeqU7lJqO1xm8AQwsnKPqRp9XwqKCdDUBSfErp8bhzBEWXliyY6h9kSOehFlKhnDjQRsMIis/alMHJqdt06Zskp7kMb5rhZ9h98p1lReUFAgB5G7skFdIsSFmM/lpusgwwRvp2VVULBam4H6sDyZfyV/QcERx4h8J13WcjHxr4zNxH01Syjj0r17KPRVdkb9n5uzzSl9FhDijFWpC3K3Qn9o9fLTR0hQSvFTWWtXwNOGXpz56aSRvqeVlsoSo9H1XtlCOArQxFtwNjRat/+8QrL9Pp6hWKJNAiOFrLEh7wOAp1C5b2fIn/vTxB0Narn5Ikqtdpw2zlAsVnyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UroG7G5rSDGuqYkXF6HBDUQI7qJrPBI0PpWiQh1OnHs=;
 b=BGqJrx3SCZyKjh4G7kUx/IO1P0b8ZCxUH3BWLN74zk2ZLRlSoPYmCwspTWBRZtPgkTiwL8T4Jxwj0IyVMrUtHoZjv8gezkfxDvBcLJiK3mGfObSYiVPnSXn9e7zenK4VH/122kQ5ucAlfpUv5QvGRHHtovT/PneRvxKslzgIorRUXZwTb3rY0M12j/SgQ19+ikEOY7fwwTAxryCE02e+cYuqCCBBtVt/+qErTZXAM67nMfmqKax3jfQ8ZqZGlZO3gRseiLx2u5ni4nlM7l/zeIklctll5G28nhk17/BOPQXlv6EugGv/H7yL50d8vi+VFc8g/YdRKVDBrGNAt31Ykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UroG7G5rSDGuqYkXF6HBDUQI7qJrPBI0PpWiQh1OnHs=;
 b=gch4n1T40F/1dsGMK1NIriqaPtm5rEPHKp/jsBkZU6o55XzRTgvvwcpUrCGENoeCw0FZZmT4og1RqHls0ce6vaNoKMwhqyuSqvKHW/3hN4sfsjW1e2VnBK0wcQG+zqH9SJjQ0MCJ8LQ05pZuThIgy6Qi+I54JkYpnONRZht5YBA=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM6PR12MB2812.namprd12.prod.outlook.com (2603:10b6:5:44::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 08:59:33 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::d00b:39da:e9a1:8cfb]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::d00b:39da:e9a1:8cfb%7]) with mapi id 15.20.3174.022; Tue, 14 Jul 2020
 08:59:33 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "Li, Dennis" <Dennis.Li@amd.com>, "Liu, Leo" <Leo.Liu@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "freedreno@lists.freedesktop.org"
 <freedreno@lists.freedesktop.org>
Thread-Topic: [PATCH 3/5] drm/amd/sriov add mmsch_v3 interface
Thread-Index: AQHWWYkVTJ3wNhLEzEm6pn8gsZsnuakGfTkAgAAq0lCAAB7/0A==
Date: Tue, 14 Jul 2020 08:59:33 +0000
Message-ID: <DM5PR1201MB020400CF71F56330AF9052FCBB610@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <1594694808-7706-1-git-send-email-Jack.Zhang1@amd.com>
 <DM5PR12MB2533AF4D5366ABD73AFA4199ED610@DM5PR12MB2533.namprd12.prod.outlook.com>
 <DM5PR1201MB02044924FD97D6217D2DCB65BB610@DM5PR1201MB0204.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB02044924FD97D6217D2DCB65BB610@DM5PR1201MB0204.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-07-14T04:35:01Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=917ecda8-6f28-442c-9002-7f1b0bc1d125;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.247.170.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e1e78245-69b2-49b0-d3ec-08d827d43a4a
x-ms-traffictypediagnostic: DM6PR12MB2812:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB28122C5991B094446C3986B6BB610@DM6PR12MB2812.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CPAsNzUw5fsyvlZFtURDFv9+2RXo5Icu1LgE0XZKvC5AZybD66Ja8AQWW8r1fQUbhjIrn20dCMBW9L9d507HcMeiUr/W/Fd4zOBHjo2pmM/OMTggudBUpMyRBhqiiWlhDOm+ulifR5Gvt7mk1vZilc2dXpOmvcOU40S1aKq2+lwGYaoo2I81qiZELZT6fi1W2JZ+Z5o2CE/R16Rj50ykud4tXIZvrLYYnbG9fAE7oOR2WdyX6Bp0vmctE+K3eAuOgZVwkq6m4CgKCulNmISdT+KEYXTILLpFt4BgN3D/8Z3Dj+xYTfd4mV8Og7OWd/zAos3qrZ9MvZGS21BGeA+avSk2062U4wpkHu1FDIoKDH0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(966005)(55016002)(52536014)(8676002)(83380400001)(66946007)(33656002)(53546011)(9686003)(2940100002)(316002)(66446008)(110136005)(76116006)(66476007)(64756008)(66556008)(5660300002)(26005)(2906002)(186003)(7696005)(86362001)(6506007)(8936002)(71200400001)(45080400002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ekk5WfuVH3YYrXuBWqONgZrRq6oLAl5vKjEMIAYmwefuHawMNdh3NyD0yA7JTGExIXc1j3yvceAXkWsBdCBf1I1S4vWyWdgpdcRqFkCvwAqaI25P4fsLclVNaXrUE41P9nn+0ULo8ukjL5ZYKlyf8cjrg0SWG8xcrQyU9lnVHUXd1RUpODKC7INn93rXf7BajH7fcL/ha+GjDkVymnLQvvjNf/XQ+3AgUdv1nOHddPnB7YmPO5Cu8wOknrhzg7rEqBQFrB9sS+2uZrZeK5vjBZ4B03pL4xfrJfBsNDgNvh9duSUGiZOeIeKlu/uz1tH6BjuInoIZtUFPnTOvtPCmwEa8FwBpFWUToWPOawqiL2CeOrRKUEu2FdjIQWi9TCTKR4lIlVX7SPG9yfL0vuS+5SuzY2MbUSCRa19EZP0KmfhSMyXiYi1xaYSTHff1RlnzSIgWmiZFt9asaJRypScuAcBuSC/dnk7Fu31Thtj4c3H6qVK/FimGk8feL7NFSSN4
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e78245-69b2-49b0-d3ec-08d827d43a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 08:59:33.5908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdh/2YUA1x0AXG3ihsuCLBFgpIZOdeYzCllXARZ3wGZN2T5x4CMbLVDS3tB7+OrG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2812
Subject: Re: [Freedreno] [PATCH 3/5] drm/amd/sriov add mmsch_v3 interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi, Dennis,

I gave some feedback in the comments.
Thank you for your review.

Best Regards,
Jack Zhang

-----Original Message-----
From: Li, Dennis <Dennis.Li@amd.com>
Sent: Tuesday, July 14, 2020 12:35 PM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 3/5] drm/amd/sriov add mmsch_v3 interface

[AMD Official Use Only - Internal Distribution Only]

Hi, Jack,
      Please see the following comments. 

Best Regards
Dennis Li
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Jack Zhang
Sent: Tuesday, July 14, 2020 10:47 AM
To: amd-gfx@lists.freedesktop.org
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>; Liu, Leo <Leo.Liu@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH 3/5] drm/amd/sriov add mmsch_v3 interface

For VCN3.0 SRIOV, Guest driver needs to communicate with mmsch to set the World Switch for MM appropriately. This patch add the interface for mmsch_v3.0.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h | 130 ++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h

diff --git a/drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h b/drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h
new file mode 100644
index 000000000000..3e4e858a6965
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/mmsch_v3_0.h
@@ -0,0 +1,130 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person 
+obtaining a
+ * copy of this software and associated documentation files (the 
+"Software"),
+ * to deal in the Software without restriction, including without 
+limitation
+ * the rights to use, copy, modify, merge, publish, distribute, 
+sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom 
+the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be 
+included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
+EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
+MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
+SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, 
+DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
+OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE 
+OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef __MMSCH_V3_0_H__
+#define __MMSCH_V3_0_H__
+
+#include "amdgpu_vcn.h"
+
+#define MMSCH_VERSION_MAJOR	3
+#define MMSCH_VERSION_MINOR	0
+#define MMSCH_VERSION	(MMSCH_VERSION_MAJOR << 16 | MMSCH_VERSION_MINOR)
+
+enum mmsch_v3_0_command_type {
+	MMSCH_COMMAND__DIRECT_REG_WRITE = 0,
+	MMSCH_COMMAND__DIRECT_REG_POLLING = 2,
+	MMSCH_COMMAND__DIRECT_REG_READ_MODIFY_WRITE = 3,
+	MMSCH_COMMAND__INDIRECT_REG_WRITE = 8,
+	MMSCH_COMMAND__END = 0xf
+};
+
+struct mmsch_v3_0_table_info {
+	uint32_t init_status;
+	uint32_t table_offset;
+	uint32_t table_size;
+};
+
+struct mmsch_v3_0_init_header {
+	uint32_t version;
+	uint32_t total_size;
+	struct mmsch_v3_0_table_info inst[AMDGPU_MAX_VCN_INSTANCES]; };

[Dennis]  You have defined total_size, why inst size is AMDGPU_MAX_VCN_INSTANCES, which will cause memory waste.
[Jack] In our case, AMDGPU_MAX_VCN_INSTANCES is a fixed number, which equals 2.  And struct mmsch_v3_0_table_info occupy 3 dws.  Thus there's not too much memory waste.

+struct mmsch_v3_0_cmd_direct_reg_header {
+	uint32_t reg_offset   : 28;
+	uint32_t command_type : 4;
+};
+
+struct mmsch_v3_0_cmd_indirect_reg_header {
+	uint32_t reg_offset    : 20;
+	uint32_t reg_idx_space : 8;
+	uint32_t command_type  : 4;
+};
+
+struct mmsch_v3_0_cmd_direct_write {
+	struct mmsch_v3_0_cmd_direct_reg_header cmd_header;
+	uint32_t reg_value;
+};
+
+struct mmsch_v3_0_cmd_direct_read_modify_write {
+	struct mmsch_v3_0_cmd_direct_reg_header cmd_header;
+	uint32_t write_data;
+	uint32_t mask_value;
+};
+
+struct mmsch_v3_0_cmd_direct_polling {
+	struct mmsch_v3_0_cmd_direct_reg_header cmd_header;
+	uint32_t mask_value;
+	uint32_t wait_value;
+};
+
+struct mmsch_v3_0_cmd_end {
+	struct mmsch_v3_0_cmd_direct_reg_header cmd_header; };
+
+struct mmsch_v3_0_cmd_indirect_write {
+	struct mmsch_v3_0_cmd_indirect_reg_header cmd_header;
+	uint32_t reg_value;
+};
+
+#define MMSCH_V3_0_INSERT_DIRECT_RD_MOD_WT(reg, mask, data) { \
+	size = sizeof(struct mmsch_v3_0_cmd_direct_read_modify_write); \
+	size_dw = size / 4; \
+	direct_rd_mod_wt.cmd_header.reg_offset = reg; \
+	direct_rd_mod_wt.mask_value = mask; \
+	direct_rd_mod_wt.write_data = data; \
+	memcpy((void *)table_loc, &direct_rd_mod_wt, size); \
+	table_loc += size_dw; \
+	table_size += size_dw; \
+}

[Dennis]  direct_rd_mod_wt, table_loc and table_size are local variables, it is better not to define them in macro, which are not very readable. 
[Jack] we inherited the code format from mmsch_v2.0 and mmsch_v1.0. And It will only be used in sriov. So it is not very convenient to re-arch the implemention of this part.

+#define MMSCH_V3_0_INSERT_DIRECT_WT(reg, value) { \
+	size = sizeof(struct mmsch_v3_0_cmd_direct_write); \
+	size_dw = size / 4; \
+	direct_wt.cmd_header.reg_offset = reg; \
+	direct_wt.reg_value = value; \
+	memcpy((void *)table_loc, &direct_wt, size); \
+	table_loc += size_dw; \
+	table_size += size_dw; \
+}
+
+#define MMSCH_V3_0_INSERT_DIRECT_POLL(reg, mask, wait) { \
+	size = sizeof(struct mmsch_v3_0_cmd_direct_polling); \
+	size_dw = size / 4; \
+	direct_poll.cmd_header.reg_offset = reg; \
+	direct_poll.mask_value = mask; \
+	direct_poll.wait_value = wait; \
+	memcpy((void *)table_loc, &direct_poll, size); \
+	table_loc += size_dw; \
+	table_size += size_dw; \
+}

[Dennis]  The same as the above

+#define MMSCH_V3_0_INSERT_END() { \
+	size = sizeof(struct mmsch_v3_0_cmd_end); \
+	size_dw = size / 4; \
+	memcpy((void *)table_loc, &end, size); \
+	table_loc += size_dw; \
+	table_size += size_dw; \
+}

[Dennis]  The same as the above

+#endif
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7CDennis.Li%40amd.com%7Cc07550519dd145540e3908d827a0355b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637302916336069337&amp;sdata=a%2FFXCiFaX91GhQesxkKipSC0S0hpaKoDw5l1ZoCHrck%3D&amp;reserved=0
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
